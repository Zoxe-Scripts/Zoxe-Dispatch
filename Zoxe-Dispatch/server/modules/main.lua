Utils = require 'shared.utils'
Function = require 'shared.function'
Framework = Utils:Core('server')

local Explosion

lib.callback.register('Zoxe_Dispatch:PlayerLists', function(source)
    return GeneratePlayerLists(source)
end)

lib.callback.register('Zoxe_Dispatch:PlayerPhone', function(source)
    return Config.GetPlayerNumber(source)
end)

lib.callback.register('Zoxe_Dispatch:ExplosionEvent', function(source)
    if Explosion then
        return Explosion
    else
        return false
    end
end)

AddEventHandler('explosionEvent', function(_, ped)
    Explosion = ped
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
