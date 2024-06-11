local Framework = {}

local QBCore = exports['qb-core']:GetCoreObject() or nil

function Framework:GetPlayerData(id)
    return exports["qb-core"]:GetPlayer(id).PlayerData
end

function Framework:GetPlayerName(id)
    local Data = Framework:GetPlayerData(id)
    return ("%s %s"):format(Data.charinfo.firstname, Data.charinfo.lastname)
end

return Framework
