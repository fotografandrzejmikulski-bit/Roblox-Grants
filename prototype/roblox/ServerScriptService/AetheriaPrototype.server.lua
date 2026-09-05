-- Aetheria: Echa Upadku
-- Grant-facing vertical slice prototype.
-- Server-authoritative, AI-provider-independent Director implementation.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local root = ReplicatedStorage:FindFirstChild("Aetheria") or Instance.new("Folder")
root.Name = "Aetheria"
root.Parent = ReplicatedStorage

local event = root:FindFirstChild("PrototypeEvent") or Instance.new("RemoteEvent")
event.Name = "PrototypeEvent"
event.Parent = root

local mission = {
    state = "HUB",
    phase = "IDLE",
    intensity = 0.20,
    route = "ALPHA",
    fallbackCount = 0,
    directorOnline = true,
    startTime = 0,
}

local allowedActions = {
    SpawnEncounter = true,
    SetWeatherProfile = true,
    CloseRoute = true,
    OpenResourceCache = true,
    StartExtractionPressure = true,
}

local function publish(kind, payload)
    event:FireAllClients(kind, payload or {})
    print("[AETHERIA]", kind, payload)
end

local function snapshot()
    local count = #Players:GetPlayers()
    return {
        phase = mission.phase,
        squadSize = count,
        intensity = mission.intensity,
        route = mission.route,
        elapsed = mission.startTime > 0 and os.clock() - mission.startTime or 0,
    }
end

local function deterministicDirector(s)
    if s.phase == "EXPEDITION" and s.elapsed < 18 then
        return { action = "SpawnEncounter", intensity = math.clamp(s.intensity + 0.15, 0, 1), reasonCode = "OPENING_PRESSURE" }
    elseif s.phase == "EXPEDITION" and s.elapsed < 36 then
        return { action = "SetWeatherProfile", profile = "STORM", reasonCode = "VISIBILITY_PRESSURE" }
    elseif s.phase == "EXPEDITION" and s.elapsed < 54 then
        return { action = "CloseRoute", route = "BETA", reasonCode = "ROUTE_DISRUPTION" }
    elseif s.phase == "EXPEDITION" then
        return { action = "StartExtractionPressure", intensity = math.min(s.intensity + 0.10, 0.85), reasonCode = "EXTRACTION_WINDOW" }
    end
    return { action = "OpenResourceCache", location = "ANCHOR_A", reasonCode = "IDLE_REWARD" }
end

local function validateAction(action)
    if type(action) ~= "table" or not allowedActions[action.action] then
        return nil, "ACTION_NOT_ALLOWED"
    end
    if action.intensity then
        action.intensity = math.clamp(tonumber(action.intensity) or 0, 0, 1)
    end
    return action
end

local function execute(action)
    local valid, err = validateAction(action)
    if not valid then
        publish("DIRECTOR_REJECTED", { error = err })
        return
    end

    if valid.action == "SpawnEncounter" then
        mission.intensity = math.max(mission.intensity, valid.intensity or mission.intensity)
        publish("ENCOUNTER", { type = "SWARM", intensity = mission.intensity })
    elseif valid.action == "SetWeatherProfile" then
        publish("WEATHER", { profile = valid.profile or "CLEAR" })
    elseif valid.action == "CloseRoute" then
        mission.route = valid.route or "BETA"
        publish("ROUTE_CLOSED", { route = mission.route })
    elseif valid.action == "OpenResourceCache" then
        publish("RESOURCE_CACHE", { location = valid.location or "ANCHOR_A" })
    elseif valid.action == "StartExtractionPressure" then
        mission.intensity = math.max(mission.intensity, valid.intensity or mission.intensity)
        publish("EXTRACTION_PRESSURE", { intensity = mission.intensity })
    end
end

local function directorTick()
    if mission.state ~= "MISSION" then return end
    local s = snapshot()
    local action

    -- Prototype can be switched to fallback without changing gameplay code.
    if mission.directorOnline then
        action = deterministicDirector(s)
        publish("DIRECTOR_DECISION", { action = action.action, reasonCode = action.reasonCode, source = "DIRECTOR_ADAPTER" })
    else
        mission.fallbackCount += 1
        action = { action = "SpawnEncounter", intensity = math.min(mission.intensity + 0.05, 0.65), reasonCode = "FALLBACK_POLICY" }
        publish("DIRECTOR_FALLBACK", { count = mission.fallbackCount })
    end
    execute(action)
end

local function startMission()
    if #Players:GetPlayers() < 1 then return end
    mission.state = "MISSION"
    mission.phase = "EXPEDITION"
    mission.intensity = 0.25
    mission.route = "ALPHA"
    mission.startTime = os.clock()
    publish("MISSION_STARTED", { squadSize = #Players:GetPlayers() })
end

local function finishMission()
    mission.state = "HUB"
    mission.phase = "EXTRACTION_COMPLETE"
    publish("MISSION_COMPLETE", { squadSize = #Players:GetPlayers(), fallbackCount = mission.fallbackCount })
    task.delay(3, function()
        mission.phase = "IDLE"
        mission.fallbackCount = 0
        publish("HUB_RETURN", {})
    end)
end

event.OnServerEvent:Connect(function(player, command, payload)
    if command == "START_MISSION" and mission.state == "HUB" then
        startMission()
    elseif command == "SIMULATE_AI_OUTAGE" then
        mission.directorOnline = false
        publish("AI_STATUS", { online = false, triggeredBy = player.UserId })
    elseif command == "RESTORE_AI" then
        mission.directorOnline = true
        publish("AI_STATUS", { online = true })
    elseif command == "EXTRACT" and mission.state == "MISSION" then
        finishMission()
    end
end)

task.spawn(function()
    while true do
        task.wait(6)
        directorTick()
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        publish("PLAYER_JOINED", { playerCount = #Players:GetPlayers() })
    end)
end)
