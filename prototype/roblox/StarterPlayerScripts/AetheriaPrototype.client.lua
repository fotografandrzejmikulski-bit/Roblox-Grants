local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local root = ReplicatedStorage:WaitForChild("Aetheria")
local stateEvent = root:WaitForChild("StateEvent")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AetheriaHUD"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(360, 210)
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
title.Text = "AETHERIA — DIRECTOR"
title.Parent = frame

local body = Instance.new("TextLabel")
body.Size = UDim2.new(1, -20, 1, -52)
body.Position = UDim2.fromOffset(10, 44)
body.BackgroundTransparency = 1
body.TextXAlignment = Enum.TextXAlignment.Left
body.TextYAlignment = Enum.TextYAlignment.Top
body.Font = Enum.Font.Code
body.TextSize = 15
body.TextWrapped = false
body.Text = "Connecting…"
body.Parent = frame

local function pct(v)
  return string.format("%d%%", math.floor((v or 0) * 100 + 0.5))
end

stateEvent.OnClientEvent:Connect(function(s)
  body.Text = table.concat({
    "PHASE       " .. tostring(s.phase),
    "PLAYERS     " .. tostring(s.players),
    "MISSION     " .. tostring(s.missionTime) .. "s",
    "PRESSURE    " .. pct(s.resourcePressure),
    "EXTRACTION  " .. pct(s.extractionProgress),
    "DIRECTOR    " .. (s.directorAvailable and "ONLINE" or "OUTAGE → FALLBACK"),
    "LAST ACTION " .. tostring(s.lastAction),
    "ACTIONS     " .. tostring(s.actionCount),
  }, "\n")
end)
