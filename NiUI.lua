
NiUI = NiUI or {}
NiUI.Name = "NiUI"

local function Initialize()

    

end

local function OnPlayerActivated(eventCode, initial) Initialize() end

local function OnAddonLoaded(eventCode, addonName)

    if addonName ~= NiUI.Name then return end
    EVENT_MANAGER:UnregisterForEvent(NiUI.Name, EVENT_ADD_ON_LOADED)
    EVENT_MANAGER:RegisterForEvent(NiUI.Name, EVENT_PLAYER_ACTIVATED, OnPlayerActivated)
    Initialize()

end

EVENT_MANAGER:RegisterForEvent(NiUI.Name, EVENT_ADD_ON_LOADED, OnAddonLoaded)
