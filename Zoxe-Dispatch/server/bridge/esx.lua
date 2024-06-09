local Framework = {}

local Shared = require 'shared.utils'

local ESX = exports['es_extended']:getSharedObject() or nil


function Framework:GetPlayerData(id)
    return ESX.GetPlayerFromId(id)
end

function Framework:GetPlayerName(id)
    return Framework:GetPlayerData(id).getName()
end

function Framework:GetPlayerJob(id)
    local Name = Framework:GetPlayerData(id).getJob().name
    local Name_Label = Framework:GetPlayerData(id).getJob().label
    local Grade = Framework:GetPlayerData(id).getJob().grade
    local Grade_Label = Framework:GetPlayerData(id).getJob().grade_label

    return { Name = Name, Name_Label = Name_Label, Grade = Grade, Grade_Label = Grade_Label }
end

return Framework
