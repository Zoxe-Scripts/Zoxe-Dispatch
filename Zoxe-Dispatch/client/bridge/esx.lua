local Framework = {}

local ESX = exports['es_extended']:getSharedObject() or nil

function Framework:GetPlayerData()
    return ESX.GetPlayerData()
end

function Framework:GetPlayerName()
    return ("%s %s"):format(Framework:GetPlayerData().firstName, Framework:GetPlayerData().lastName)
end

function Framework:GetPlayerJob()
    local Name = Framework:GetPlayerData().job.name
    local Name_Label = Framework:GetPlayerData().job.label
    local Grade = Framework:GetPlayerData().job.grade
    local Grade_Label = Framework:GetPlayerData().job.grade_label

    return { Name = Name, Name_Label = Name_Label, Grade = Grade, Grade_Label = Grade_Label }
end

return Framework
