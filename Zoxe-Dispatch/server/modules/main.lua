Utils = require 'shared.utils'
Function = require 'shared.function'
Framework = Utils:Core('server')

lib.callback.register('Zoxe_Dispatch:PlayerLists', function(source)
    return GeneratePlayerLists(source)
end)

AddEventHandler('explosionEvent', function(_, ped)
    lib.callback.register('Zoxe_Dispatch:ExplosionEvent', function(source)
        return ped
    end)
end)

RegisterNetEvent('Zoxe_Dispatch:Post', function(Data)
    Utils:ReturnDebug(Data)

    if not Data.Other or not Data.Args then
        Post(Data)
    else
        if Function:CheckJob({ Id = Data.Other.ServerId, Job = Data.Args.Job, SendTo = Data.Args.SendTo, Allert = Data.Other.Allert }) then
            Post(Data)
        end
    end
end)
