-- Aetheria: Echa Upadku
-- Lightweight client HUD for the grant-facing vertical slice.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local root = ReplicatedStorage:WaitForChild("Aetheria")
local event = root:WaitForChild("PrototypeEvent")

local gui = Instance.new("ScreenGui")
gui.Name = "AetheriaPrototypeHUD"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local title = Instance.new("TextLabel")
title.Size = UDim2.fromOffset(420, 44)
title.Position = UDim2.fromOffset(24, 24)
title.BackgroundTransparency = 0.25
title.Text = "AETHERIA // ECHA UPADKU"
title.TextScaled = true
title.Parent = gui

local status = Instance.new("TextLabel")
status.Size = UDim2.fromOffset(620, 180)
status.Position = UDim2.fromOffset(24, 78)
status.BackgroundTransparency = 0.30
status.TextXAlignment = Enum.TextXAlignment.Left
status.TextYAlignment = Enum.TextYAlignment.Top
status.TextWrapped = true
status.TextSize = 20
status.Text = "Vertical Slice\nSTATUS: HUB\nDirector: ready"
status.Parent = gui

local function write(line)
    status.Text ..= "\n" .. line
end

event.OnClientEvent:Connect(function(kind, payload)
    payload = payload or {}
    if kind == "MISSION_STARTED" then
        status.Text = "Vertical Slice\nSTATUS: EXPEDITION\nSquad: " .. tostring(payload.squadSize or "?")
    elseif kind == "DIRECTOR_DECISION" then
        write("Director → " .. tostring(payload.action) .. " [" .. tostring(payload.reasonCode) .. "]")
    elseif kind == "DIRECTOR_FALLBACK" then
        write("Director FALLBACK engaged (#" .. tostring(payload.count) .. ")")
    elseif kind == "ENCOUNTER" then
        write("Encounter: " .. tostring(payload.type) .. " / intensity " .. string.format("%.2f", payload.intensity or 0))
    elseif kind == "WEATHER" then
        write("Environment: " .. tostring(payload.profile))
    elseif kind == "ROUTE_CLOSED" then
        write("Route closed: " .. tostring(payload.route))
    elseif kind == "RESOURCE_CACHE" then
        write("Resource cache opened: " .. tostring(payload.location))
    elseif kind == "EXTRACTION_PRESSURE" then
        write("Extraction pressure: " .. string.format("%.2f", payload.intensity or 0))
    elseif kind == "AI_STATUS" then
        write("AI adapter online = " .. tostring(payload.online))
    elseif kind == "MISSION_COMPLETE" then
        status.Text = "Vertical Slice\nSTATUS: EXTRACTION COMPLETE\nFallback events: " .. tostring(payload.fallbackCount or 0)
    elseif kind == "HUB_RETURN" then
        status.Text = "Vertical Slice\nSTATUS: HUB\nReady for next expedition"
    elseif kind == "PLAYER_JOINED" then
        write("Player count: " .. tostring(payload.playerCount))
    end
end)

-- Prototype controls: visible only in the vertical slice HUD.
local start = Instance.new("TextButton")
start.Size = UDim2.fromOffset(220, 48)
start.Position = UDim2.fromOffset(24, 270)
start.Text = "START EXPEDITION"
start.Parent = gui
start.MouseButton1Click:Connect(function()
    event:FireServer("START_MISSION")
end)

local outage = Instance.new("TextButton")
outage.Size = UDim2.fromOffset(220, 48)
outage.Position = UDim2.fromOffset(260, 270)
outage.Text = "SIMULATE AI OUTAGE"
outage.Parent = gui
outage.MouseButton1Click:Connect(function()
    event:FireServer("SIMULATE_AI_OUTAGE")
end)

local restore = Instance.new("TextButton")
restore.Size = UDim2.fromOffset(220, 48)
restore.Position = UDim2.fromOffset(496, 270)
restore.Text = "RESTORE AI"
restore.Parent = gui
restore.MouseButton1Click:Connect(function()
    event:FireServer("RESTORE_AI")
end)

local extract = Instance.new("TextButton")
extract.Size = UDim2.fromOffset(220, 48)
extract.Position = UDim2.fromOffset(732, 270)
extract.Text = "EXTRACT"
extract.Parent = gui
extract.MouseButton1Click:Connect(function()
    event:FireServer("EXTRACT")
end)
