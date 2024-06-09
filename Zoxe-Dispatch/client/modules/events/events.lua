AddEventHandler('CEventGunShot', function(_, ped)
    if IsPedCurrentWeaponSilenced(cache.ped) then return end
    if not Function:WeaponWhitelist(cache.ped) then return end

    Function:WaitTimer('Shooting', function()
        if cache.ped ~= ped then return end

        if cache.vehicle then
            Allerts.VehicleShooting()
        else
            Allerts.Shooting()
        end
    end)
end)

AddEventHandler('CEventShockingSeenMeleeAction', function(_, ped)
    Function:WaitTimer('Fight', function()
        if cache.ped ~= ped then return end
        if not IsPedInMeleeCombat(ped) then return end

        Allerts.Fight()
    end)
end)

AddEventHandler('CEventPedJackingMyVehicle', function(_, ped)
    Function:WaitTimer('VehicleJacking', function()
        if cache.ped ~= ped then return end

        Allerts.VehicleJacking()
    end)
end)

AddEventHandler('CEventShockingCarAlarm', function(_, ped)
    Function:WaitTimer('VehicleTheft', function()
        if cache.ped ~= ped then return end

        Allerts.VehicleTheft()
    end)
end)

AddEventHandler('CEventExplosionHeard', function(_, ped)
    Function:WaitTimer('Explosion', function()
        Allerts.Explosion()
    end)
end)

AddEventHandler('gameEventTriggered', function(name, args)
    if name ~= 'CEventNetworkEntityDamage' then return end

    local victim = args[1]
    local reason = args[3]
    local dead = args[6] == 1

    Function:WaitTimer('PlayerDowned', function()
        if not victim or victim ~= cache.ped then return end
        if not dead then return end

        Allerts.PlayerDowned(reason)
    end)
end)


local Speedings = {
    'CEventShockingCarChase',
    'CEventShockingDrivingOnPavement',
    'CEventShockingBicycleOnPavement',
    'CEventShockingMadDriverBicycle',
    'CEventShockingMadDriverExtreme',
    'CEventShockingEngineRevved',
    'CEventShockingInDangerousVehicle'
}

local Speed = 0
for _, Speeding in ipairs(Speedings) do
    AddEventHandler(Speeding, function(_, ped)
        Function:WaitTimer('VehicleSpeed', function()
            local Time = GetGameTimer()

            if Time - Speed < 10000 then
                return
            end

            if cache.ped ~= ped then return end

            if GetEntitySpeed(cache.vehicle) * 3.6 < (80 + math.random(0, 20)) then return end

            if cache.ped ~= GetPedInVehicleSeat(cache.vehicle, -1) then return end

            Allerts.VehicleSpeed()

            Speed = Time
        end)
    end)
end
