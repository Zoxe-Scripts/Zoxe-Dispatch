local Framework = {}

local Legacy = exports.LegacyFramework:ReturnFramework() or nil

function Framework:GetPlayerData()
    return LocalPlayer.state.playerData[1]
end

function Framework:GetPlayerName()
    return ("%s %s"):format(Framework:GetPlayerData().firstName, Framework:GetPlayerData().lastName)
end

function Framework:GetPlayerJob()
    local Name = Framework:GetPlayerData().nameJob
    local Job = lib.callback.await('Zoxe_Dispatch:GetPlayerJob', false, Name)
    local Grade_Label = Job.grade_label

    return { Name = Name, Grade_Label = Grade_Label }
end

return Framework
