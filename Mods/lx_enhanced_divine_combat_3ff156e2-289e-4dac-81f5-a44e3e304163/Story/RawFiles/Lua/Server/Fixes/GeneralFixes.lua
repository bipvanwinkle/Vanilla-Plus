Ext.RegisterNetListener("VP_ForceSyncCharacter", function(channel, payload, user)
    local character = Ext.ServerEntity.GetCharacter(tonumber(payload))
    CharacterSetForceSynch(character.MyGuid, 1)
    _VWarning("Forced sync", "Server/Fixes/GeneralFixes", "on character", character.DisplayName, "GUID:", character.MyGuid)
end)