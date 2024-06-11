local Framework = {}

local Legacy = exports.LegacyFramework:ReturnFramework() or nil

function Framework:GetPlayerData(id)
    return Legacy.SvPlayerFunctions.GetPlayerData(id)[1]
end

function Framework:GetPlayerName(id)
    local Data = Framework:GetPlayerData(id)
    return ("%s %s"):format(Data.firstName, Data.lastName)
end

function Framework:GetPlayerJob(id)
    local Name = Framework:GetPlayerData(id).nameJob
    local Job = Framework:GetJob(Name)
    local Grade_Label = Job.grade_label

    return { Name = Name, Grade_Label = Grade_Label }
end

function Framework:GetJob(Job)
    local Result = MySQL.query.await('SELECT * FROM ' .. Config.Job.Table .. ' WHERE `job_name` = ?', { Job })
    if Result and #Result > 0 then
        return Result[1]
    end
end

lib.callback.register('Zoxe_Dispatch:GetPlayerJob', function(source, Job)
    return Framework:GetJob(Job)
end)

return Framework
