local Framework = {}

local QBCore = exports['qb-core']:GetCoreObject() or nil

function Framework:GetPlayerData(id)
    return QBCore.Functions.GetPlayer(id).PlayerData
end

function Framework:GetPlayerName(id)
    local Data = Framework:GetPlayerData(id)
    return ("%s %s"):format(Data.charinfo.firstname, Data.charinfo.lastname)
end

function Framework:GetPlayerJob(id)
    local Name = Framework:GetPlayerData(id).job.name
    local Grade_Label = Framework:GetPlayerData(id).job.grade.name

    return { Name = Name, Grade_Label = Grade_Label }
end

return Framework
