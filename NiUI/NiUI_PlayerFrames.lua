
local NiUI = NiUI or {}
NiUI.playerFrames = {}

_playerHealth = nil
_playerHealth_Bar = nil
_playerStamina = nil
_playerMagicka = nil
_playerReticle = nil

function NiUI.PlayerFrames:HookAll()

    _playerHealth = ZO_PlayerAttributeHealth
    _playerStamina = ZO_PlayerAttributeStamina
    _playerMagicka = ZO_PlayerAttributeMagicka
    _playerReticle = ZO_Reticle

    if not (_playerHealth and _playerStamina and _playerMagicka and _playerReticle) then
        if not _playerHealth then d("_playerHealth is nil") end
        if not _playerStamina then d("_playerStamina is nil") end
        if not _playerMagicka then d("_playerMagicka is nil") end
        if not _playerReticle then d("_playerReticle is nil") end
        return false
    end

    _playerHealth_Bar = _playerHealth:GetNamedChild("BgContainer"):GetNamedChild("Bar")

    if not _playerHealth_Bar then
        d("_playerHealth_Bar is nil")
        return false
    end

    return true

end

function NiUI.PlayerFrames:ReanchorAll()

    if not (_playerHealth and _playerStamina and _playerMagicka and _playerReticle and _playerHealth_Bar) then return false end
    
    _playerHealth:ClearAnchors()
    _playerHealth:SetAnchor(CENTER, _playerReticle, CENTER, 0, 50)
    _playerStamina:ClearAnchors()
    _playerStamina:SetAnchor(LEFT, _playerHealth_Bar, RIGHT, 10, 0)
    _playerMagicka:ClearAnchors()
    _playerMagicka:SetAnchor(RIGHT, _playerHealth_Bar, LEFT, -10, 0)

    return true

end

