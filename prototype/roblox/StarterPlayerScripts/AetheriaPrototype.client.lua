-- Aetheria: Echa Upadku
-- Grant-facing vertical slice HUD and test controls.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local root = ReplicatedStorage:WaitForChild("Aetheria")
local event = root:WaitForChild("PrototypeEvent")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "AetheriaHUD"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(440, 320)
frame.Position = UDim2.fromOffset(20, 20)
frame.BackgroundTransparency = 0.12
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 32)
title.Position = UDim2.fromOffset(10, 8)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Text = "AETHERIA — DIRECTOR / VERTICAL SLICE"
title.Parent = frame

local body = Instance.new("TextLabel")
body.Size = UDim2.new(1, -20, 1, -98)
body.Position = UDim2.fromOffset(10, 44)
body.BackgroundTransparency = 1
body.TextXAlignment = Enum.TextXAlignment.Left
body.TextYAlignment = Enum.TextYAlignment.Top
body.Font = Enum.Font.Code
body.TextSize = 15
body.TextWrapped = false
body.Text = "Connecting…"
body.Parent = frame

local function makeButton(name, text, x, command)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.fromOffset(128, 32)
    button.Position = UDim2.fromOffset(x, 278)
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 12
    button.Text = text
    button.Parent = frame
    button.Activated:Connect(function()
        event:FireServer(command)
    end)
end

makeButton("Start", "START", 10, "START_MISSION")
makeButton("Outage", "SIMULATE OUTAGE", 148, "SIMULATE_AI_OUTAGE")
makeButton("Restore", "RESTORE AI", 286, "RESTORE_AI")

local extract = Instance.new("TextButton")
extract.Name = "Extract"
extract.Size = UDim2.fromOffset(128, 28)
extract.Position = UDim2.fromOffset(148, 246)
extract.Font = Enum.Font.GothamMedium
extract.TextSize = 12
extract.Text = "EXTRACT NOW"
extract.Parent = frame
extract.Activated:Connect(function()
    event:FireServer("EXTRACT")
end)

local function percent(value)
    return string.format("%d%%", math.floor((value or 0) * 100 + 0.5))
end

local function renderState(payload)
    body.Text = table.concat({
        "PHASE          " .. tostring(payload.phase),
        "PLAYERS        " .. tostring(payload.players),
        "MISSION TIME   " .. tostring(payload.missionTime) .. "s",
        "PRESSURE       " .. percent(payload.resourcePressure),
        "EXTRACTION     " .. percent(payload.extractionProgress),
        "ROUTE          " .. tostring(payload.route or "—"),
        "DIRECTOR       " .. (payload.directorAvailable and "ONLINE" or "OUTAGE → FALLBACK"),
        "LAST ACTION    " .. tostring(payload.lastAction),
        "ACTIONS        " .. tostring(payload.actionCount),
    }, "\n")
end

event.OnClientEvent:Connect(function(kind, payload)
    payload = payload or {}
    if kind == "STATE" then
        renderState(payload)
    elseif kind == "DIRECTOR_DECISION" then
        print("[AETHERIA CLIENT] Director:", payload.action, payload.reasonCode)
    elseif kind == "DIRECTOR_FALLBACK" then
        print("[AETHERIA CLIENT] FALLBACK:", payload.selectedAction, payload.reasonCode)
    elseif kind == "MISSION_COMPLETE" then
        print("[AETHERIA CLIENT] Mission complete; fallbacks:", payload.fallbackCount)
    else
        print("[AETHERIA CLIENT]", kind, payload)
    end
end)
