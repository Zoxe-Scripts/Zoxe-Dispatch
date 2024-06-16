local Framework = {}

local QBX = exports['qb-core']:GetCoreObject() or nil

function Framework:GetPlayerData(id)
    return exports.qbx_core:GetPlayer(id).PlayerData
end

function Framework:GetPlayerName(id)
    local Data = Framework:GetPlayerData(id)
    return string.format("%s %s", Data.charinfo.firstname, Data.charinfo.lastname)
end

function Framework:GetPlayerJob(id)
    local Name = Framework:GetPlayerData(id).job.name
    local Grade_Label = Framework:GetPlayerData(id).job.grade.name

    return { Name = Name, Grade_Label = Grade_Label }
end

return Framework
