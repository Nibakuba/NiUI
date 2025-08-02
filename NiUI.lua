
NiUI = NiUI or {}
NiUI.Name = "NiUI"

local function Initialize()

    local Hooked = NiUI.playerFrames:HookAll()
    local Reanchored = NiUI.playerFrames.ReanchorAll()

    if not (Hooked and Reanchored) then
        if not Hooked then d("HookAll failed") end
        if not Reanchored then d("ReanchorAll failed") end
    end

end

local function OnPlayerActivated(eventCode, initial) Initialize() end

local function OnAddonLoaded(eventCode, addonName)

    if addonName ~= NiUI.Name then return end
    EVENT_MANAGER:UnregisterForEvent(NiUI.Name, EVENT_ADD_ON_LOADED)
    EVENT_MANAGER:RegisterForEvent(NiUI.Name, EVENT_PLAYER_ACTIVATED, OnPlayerActivated)
    Initialize()

end

EVENT_MANAGER:RegisterForEvent(NiUI.Name, EVENT_ADD_ON_LOADED, OnAddonLoaded)
