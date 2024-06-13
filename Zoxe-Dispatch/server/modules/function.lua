function GeneratePlayerLists(source)
    local PlayerList = {}

    local PlayerName = Function:PlayerName(
        { Name = Config.Settings.PlayerLists, Id = source }
    )

    for _, Id in ipairs(GetPlayers()) do
        local Player = Framework:GetPlayerData(Id)
        local Job = Framework:GetPlayerJob(Id).Name
        local Name = Function:PlayerName(
            { Name = Config.Settings.PlayerLists, Id = Id }
        )

        if PlayerName ~= Name then
            local Code = Function:BadgeNumber(Name)
            local Title = Function:PlayerName(
                { Name = Config.Settings.Dispatchs, Id = Id }
            )

            table.insert(PlayerList, {
                Code = Code,
                Title = Title,
                Player = {
                    Source = source,
                    Id = Id,
                    GetPlayerData = Player
                },
                PlayerList = true
            })
        end
    end

    return PlayerList
end

function Post(Data)
    if Data.Args.SendTo == 'Everyone' then
        TriggerClientEvent('Zoxe_Dispatch:Post', -1, Data)
    elseif Data.Args.SendTo == 'Job' then
        for _, SendTo in pairs(Function:SendTo(Data.Args.Job)) do
            TriggerClientEvent('Zoxe_Dispatch:Post', SendTo, Data)
        end
    else
        TriggerClientEvent('Zoxe_Dispatch:Post', -1, Data)
    end
end
