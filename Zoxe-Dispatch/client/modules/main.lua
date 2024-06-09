Utils = require 'shared.utils'
Function = require 'shared.function'
ModList = require 'client.modules.events.modlist'
Framework = Utils:Core('client')

local Mapping = {
    ResponseDispatch = ResponseDispatch,
    DeleteDispatch = DeleteDispatch,
    PlayerListsDispatch = PlayerListsDispatch,
    NewAllertDispatch = NewAllertDispatch
}

RegisterNUICallback('Zoxe_Dispatch:Close', function()
    CloseDispatch()
end)

RegisterNUICallback('Zoxe_Dispatch:Post', function(Data)
    Utils:ReturnDebug(Data)

    if Data.Type == 'Response' then
        TriggerServerEvent('Zoxe_Dispatch:Post', {
            Function = 'ResponseDispatch',
            Args = Data
        })
    elseif Data.Type == 'Delete' then
        DeleteDispatch(Data)
    elseif Data.Type == 'PlayerLists' then
        PlayerListsDispatch(Data)
    elseif Data.Type == 'PanicButtons' then
        Allerts.PanicButton()
    elseif Data.Type == 'Reload' then
        ReloadDispatch()
    elseif Data.Type == 'Show' then
        ShowDispatch()
    elseif Data.Type == 'Sound' then
        SoundDispatch()
    end
end)

RegisterNetEvent('Zoxe_Dispatch:Post', function(Data)
    Utils:ReturnDebug(Data)

    Mapping[Data.Function](Data.Args)

    if not Data.Other or not Data.Args then return end
    Function:Blip(Data.Other.Cfg.Blip, Data.Other.Blip, Data.Other.Ped)
end)
