local Framework = {}

local QBCore = exports['qb-core']:GetCoreObject() or nil

function Framework:GetPlayerData()
    return QBCore.Functions.GetPlayerData()
end

function Framework:GetPlayerName()
    return ("%s %s"):format(Framework:GetPlayerData().charinfo.firstname, Framework:GetPlayerData().charinfo.lastname)
end

function Framework:GetPlayerJob()
    local Name = Framework:GetPlayerData().job.name
    local Grade_Label = Framework:GetPlayerData().job.grade.name

    return { Name = Name, Grade_Label = Grade_Label }
end

return Framework
