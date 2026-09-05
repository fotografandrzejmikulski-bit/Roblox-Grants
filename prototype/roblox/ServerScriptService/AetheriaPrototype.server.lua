local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local ROOT = "Aetheria"
local remotes = ReplicatedStorage:FindFirstChild(ROOT) or Instance.new("Folder")
remotes.Name = ROOT
remotes.Parent = ReplicatedStorage

local event = remotes:FindFirstChild("DirectorEvent") or Instance.new("RemoteEvent")
event.Name = "DirectorEvent"
event.Parent = remotes

local stateEvent = remotes:FindFirstChild("StateEvent") or Instance.new("RemoteEvent")
stateEvent.Name = "StateEvent"
stateEvent.Parent = remotes

local state = {
  phase = "HUB",
  missionTime = 0,
  extractionProgress = 0,
  resourcePressure = 0.25,
  directorAvailable = true,
  lastAction = "NONE",
  actionCount = 0,
}

local ACTIONS = {
  SpawnEncounter = {cooldown = 8, max = 3},
  SetWeatherProfile = {cooldown = 10, max = 2},
  OpenResourceCache = {cooldown = 12, max = 2},
  StartExtractionPressure = {cooldown = 14, max = 2},
}

local actionHistory = {}
local allowList = {}
for name in pairs(ACTIONS) do allowList[name] = true end

local function snapshot()
  return {
    phase = state.phase,
    missionTime = state.missionTime,
    players = #Players:GetPlayers(),
    resourcePressure = state.resourcePressure,
    extractionProgress = state.extractionProgress,
  }
end

local function emit()
  stateEvent:FireAllClients({
    phase = state.phase,
    missionTime = state.missionTime,
    resourcePressure = state.resourcePressure,
    extractionProgress = state.extractionProgress,
    directorAvailable = state.directorAvailable,
    lastAction = state.lastAction,
    actionCount = state.actionCount,
    players = #Players:GetPlayers(),
  })
end

local function canExecute(action)
  local meta = ACTIONS[action]
  if not meta or not allowList[action] then return false end
  local now = os.clock()
  local last = actionHistory[action] or 0
  return (now - last) >= meta.cooldown
end

local function executeAction(action, params)
  if not canExecute(action) then return false end
  actionHistory[action] = os.clock()
  state.lastAction = action
  state.actionCount += 1

  if action == "SpawnEncounter" then
    state.resourcePressure = math.clamp(state.resourcePressure + 0.14, 0, 1)
  elseif action == "SetWeatherProfile" then
    state.resourcePressure = math.clamp(state.resourcePressure + 0.04, 0, 1)
  elseif action == "OpenResourceCache" then
    state.resourcePressure = math.clamp(state.resourcePressure - 0.20, 0, 1)
  elseif action == "StartExtractionPressure" then
    state.resourcePressure = math.clamp(state.resourcePressure + 0.10, 0, 1)
  end

  emit()
  return true
end

local fallbackIndex = 0
local fallbackActions = {"OpenResourceCache", "SpawnEncounter", "SetWeatherProfile"}
local function fallbackDirector()
  for _ = 1, #fallbackActions do
    fallbackIndex = (fallbackIndex % #fallbackActions) + 1
    local action = fallbackActions[fallbackIndex]
    if executeAction(action, {fallback = true}) then return action end
  end
  state.lastAction = "FALLBACK_NOOP"
  emit()
  return "FALLBACK_NOOP"
end

local function directorTick()
  if state.phase ~= "EXPEDITION" then return end
  if not state.directorAvailable then
    return fallbackDirector()
  end

  local s = snapshot()
  local action
  if s.extractionProgress >= 0.72 then
    action = "StartExtractionPressure"
  elseif s.resourcePressure >= 0.62 then
    action = "OpenResourceCache"
  elseif s.missionTime % 3 < 1 then
    action = "SpawnEncounter"
  else
    action = "SetWeatherProfile"
  end

  if not executeAction(action, {snapshot = s}) then
    return fallbackDirector()
  end
  return action
end

local function beginMission()
  state.phase = "EXPEDITION"
  state.missionTime = 0
  state.extractionProgress = 0
  state.resourcePressure = 0.25
  state.lastAction = "MISSION_STARTED"
  state.actionCount = 0
  actionHistory = {}
  emit()
end

local function finishMission()
  state.phase = "HUB"
  state.lastAction = "EXTRACTION_COMPLETE"
  state.missionTime = 0
  state.extractionProgress = 0
  state.resourcePressure = 0.20
  emit()
end

Players.PlayerAdded:Connect(function()
  task.defer(emit)
end)
Players.PlayerRemoving:Connect(function()
  task.defer(emit)
end)

-- Server-only test controls. In Studio, call these through the command bar:
-- game.ReplicatedStorage.Aetheria.DirectorEvent:FireAllClients("StartMission")
-- For safer testing, the loop below automatically starts an expedition once a player exists.

task.spawn(function()
  while true do
    task.wait(1)
    if #Players:GetPlayers() > 0 and state.phase == "HUB" then
      beginMission()
    elseif state.phase == "EXPEDITION" then
      state.missionTime += 1
      state.extractionProgress = math.clamp(state.extractionProgress + 0.018, 0, 1)
      state.resourcePressure = math.clamp(state.resourcePressure + 0.01, 0, 1)
      directorTick()
      if state.extractionProgress >= 1 then
        finishMission()
      else
        emit()
      end
    end
  end
end)

-- Controlled outage simulation: periodically prove deterministic fallback behavior.
task.spawn(function()
  while true do
    task.wait(22)
    if state.phase == "EXPEDITION" then
      state.directorAvailable = false
      state.lastAction = "DIRECTOR_OUTAGE"
      emit()
      task.wait(7)
      state.directorAvailable = true
      state.lastAction = "DIRECTOR_RESTORED"
      emit()
    end
  end
end)

print("Aetheria vertical slice server initialized")
