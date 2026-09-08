-- Aetheria: Echa Upadku
-- Grant-facing vertical slice prototype.
-- Server-authoritative, deterministic Director with AI-provider seam.

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
    extractionProgress = 0,
    fallbackCount = 0,
    actionCount = 0,
    directorOnline = true,
    startTime = 0,
    lastAction = "NONE",
    lastReason = "NONE",
}

local allowedActions = {
    SpawnEncounter = true,
    SetWeatherProfile = true,
    CloseRoute = true,
    OpenResourceCache = true,
    StartExtractionPressure = true,
}

local actionCooldowns = {
    SpawnEncounter = 8,
    SetWeatherProfile = 10,
    CloseRoute = 12,
    OpenResourceCache = 12,
    StartExtractionPressure = 14,
}

local lastActionAt = {}
local fallbackIndex = 0
local fallbackActions = {
    "OpenResourceCache",
    "SpawnEncounter",
    "SetWeatherProfile",
}

local function playerCount()
    return #Players:GetPlayers()
end

local function publish(kind, payload)
    event:FireAllClients(kind, payload or {})
    print("[AETHERIA]", kind, payload)
end

local function publishState()
    publish("STATE", {
        phase = mission.phase,
        missionTime = math.floor(mission.startTime > 0 and (os.clock() - mission.startTime) or 0),
        extractionProgress = mission.extractionProgress,
        resourcePressure = mission.intensity,
        directorAvailable = mission.directorOnline,
        lastAction = mission.lastAction,
        actionCount = mission.actionCount,
        players = playerCount(),
        route = mission.route,
    })
end

local function snapshot()
    return {
        phase = mission.phase,
        squadSize = playerCount(),
        intensity = mission.intensity,
        route = mission.route,
        extractionProgress = mission.extractionProgress,
        elapsed = mission.startTime > 0 and (os.clock() - mission.startTime) or 0,
    }
end

local function deterministicDirector(s)
    if s.extractionProgress >= 0.72 then
        return {
            action = "StartExtractionPressure",
            intensity = math.min(s.intensity + 0.10, 0.85),
            reasonCode = "EXTRACTION_WINDOW",
        }
    elseif s.intensity >= 0.65 then
        return {
            action = "OpenResourceCache",
            location = "ANCHOR_A",
            reasonCode = "RESOURCE_PRESSURE_HIGH",
        }
    elseif s.elapsed < 18 then
        return {
            action = "SpawnEncounter",
            intensity = math.min(s.intensity + 0.15, 0.75),
            reasonCode = "OPENING_PRESSURE",
        }
    elseif s.elapsed < 36 then
        return {
            action = "SetWeatherProfile",
            profile = "STORM",
            reasonCode = "VISIBILITY_PRESSURE",
        }
    elseif s.elapsed < 54 then
        return {
            action = "CloseRoute",
            route = "BETA",
            reasonCode = "ROUTE_DISRUPTION",
        }
    end

    return {
        action = "StartExtractionPressure",
        intensity = math.min(s.intensity + 0.10, 0.80),
        reasonCode = "LATE_MISSION_PRESSURE",
    }
end

local function validateAction(action)
    if type(action) ~= "table" or type(action.action) ~= "string" then
        return nil, "MALFORMED_ACTION"
    end

    if not allowedActions[action.action] then
        return nil, "ACTION_NOT_ALLOWED"
    end

    local cooldown = actionCooldowns[action.action]
    local previous = lastActionAt[action.action] or -math.huge
    if os.clock() - previous < cooldown then
        return nil, "ACTION_COOLDOWN"
    end

    if action.intensity ~= nil then
        action.intensity = math.clamp(tonumber(action.intensity) or 0, 0, 1)
    end

    if action.action == "SetWeatherProfile"
        and action.profile ~= "STORM"
        and action.profile ~= "CLEAR" then
        return nil, "INVALID_WEATHER_PROFILE"
    end

    if action.action == "CloseRoute"
        and action.route ~= "ALPHA"
        and action.route ~= "BETA" then
        return nil, "INVALID_ROUTE"
    end

    lastActionAt[action.action] = os.clock()
    return action
end

local function executeAction(action)
    local valid, err = validateAction(action)
    if not valid then
        publish("DIRECTOR_REJECTED", { error = err })
        return false
    end

    mission.actionCount += 1
    mission.lastAction = valid.action
    mission.lastReason = valid.reasonCode or "NONE"

    if valid.action == "SpawnEncounter" then
        mission.intensity = math.max(mission.intensity, valid.intensity or mission.intensity)
        publish("ENCOUNTER", {
            type = "SWARM",
            intensity = mission.intensity,
        })
    elseif valid.action == "SetWeatherProfile" then
        publish("WEATHER", { profile = valid.profile or "CLEAR" })
    elseif valid.action == "CloseRoute" then
        mission.route = valid.route or "BETA"
        publish("ROUTE_CLOSED", { route = mission.route })
    elseif valid.action == "OpenResourceCache" then
        mission.intensity = math.max(0, mission.intensity - 0.18)
        publish("RESOURCE_CACHE", {
            location = valid.location or "ANCHOR_A",
            intensity = mission.intensity,
        })
    elseif valid.action == "StartExtractionPressure" then
        mission.intensity = math.max(mission.intensity, valid.intensity or mission.intensity)
        publish("EXTRACTION_PRESSURE", { intensity = mission.intensity })
    end

    publishState()
    return true
end

local function fallbackDirector()
    fallbackIndex = (fallbackIndex % #fallbackActions) + 1
    local selected = fallbackActions[fallbackIndex]
    mission.fallbackCount += 1

    publish("DIRECTOR_FALLBACK", {
        count = mission.fallbackCount,
        reasonCode = "DIRECTOR_UNAVAILABLE",
        selectedAction = selected,
    })

    if selected == "OpenResourceCache" then
        return executeAction({
            action = selected,
            location = "ANCHOR_A",
            reasonCode = "FALLBACK_POLICY",
        })
    elseif selected == "SpawnEncounter" then
        return executeAction({
            action = selected,
            intensity = math.min(mission.intensity + 0.05, 0.65),
            reasonCode = "FALLBACK_POLICY",
        })
    end

    return executeAction({
        action = selected,
        profile = "STORM",
        reasonCode = "FALLBACK_POLICY",
    })
end

local function directorTick()
    if mission.state ~= "MISSION" then
        return
    end

    local s = snapshot()
    if mission.directorOnline then
        local proposal = deterministicDirector(s)
        publish("DIRECTOR_DECISION", {
            action = proposal.action,
            reasonCode = proposal.reasonCode,
            source = "DIRECTOR_ADAPTER",
        })
        executeAction(proposal)
    else
        fallbackDirector()
    end
end

local function resetMission()
    mission.state = "HUB"
    mission.phase = "IDLE"
    mission.intensity = 0.20
    mission.route = "ALPHA"
    mission.extractionProgress = 0
    mission.fallbackCount = 0
    mission.actionCount = 0
    mission.startTime = 0
    mission.lastAction = "NONE"
    mission.lastReason = "NONE"
    mission.directorOnline = true
    lastActionAt = {}
end

local function startMission()
    if playerCount() < 1 or mission.state ~= "HUB" then
        return
    end

    mission.state = "MISSION"
    mission.phase = "EXPEDITION"
    mission.intensity = 0.25
    mission.route = "ALPHA"
    mission.extractionProgress = 0
    mission.fallbackCount = 0
    mission.actionCount = 0
    mission.startTime = os.clock()
    mission.lastAction = "MISSION_STARTED"
    mission.lastReason = "PLAYER_INITIATED"
    lastActionAt = {}

    publish("MISSION_STARTED", { squadSize = playerCount() })
    publishState()
end

local function finishMission()
    if mission.state ~= "MISSION" then
        return
    end

    mission.state = "HUB"
    mission.phase = "EXTRACTION_COMPLETE"
    mission.lastAction = "EXTRACTION_COMPLETE"

    publish("MISSION_COMPLETE", {
        squadSize = playerCount(),
        fallbackCount = mission.fallbackCount,
        actionCount = mission.actionCount,
    })
    publishState()

    task.delay(3, function()
        resetMission()
        publish("HUB_RETURN", {})
        publishState()
    end)
end

event.OnServerEvent:Connect(function(player, command)
    if type(command) ~= "string" then
        return
    end

    if command == "START_MISSION" then
        startMission()
    elseif command == "SIMULATE_AI_OUTAGE" and mission.state == "MISSION" then
        mission.directorOnline = false
        publish("AI_STATUS", { online = false, triggeredBy = player.UserId })
        publishState()
    elseif command == "RESTORE_AI" then
        mission.directorOnline = true
        publish("AI_STATUS", { online = true })
        publishState()
    elseif command == "EXTRACT" and mission.state == "MISSION" then
        finishMission()
    end
end)

task.spawn(function()
    while true do
        task.wait(1)

        if mission.state == "MISSION" then
            mission.extractionProgress = math.clamp(mission.extractionProgress + 0.018, 0, 1)
            mission.intensity = math.clamp(mission.intensity + 0.004, 0, 1)
            directorTick()
            publishState()

            if mission.extractionProgress >= 1 then
                finishMission()
            end
        else
            publishState()
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        publish("PLAYER_JOINED", { playerCount = playerCount() })
        publishState()
    end)
end)

resetMission()
publishState()
print("Aetheria vertical slice server initialized")
