local Function = {}
local Timer = {}

-- Check

function Function:CanOpen()
    local Ped = cache.ped
    local Job = Framework:GetPlayerJob().Name or Framework:GetPlayerJob(Id).Name

    if not LocalPlayer.state.invOpen and not IsPauseMenuActive() and not Config.GetPlayerDeath(Ped) then
        for _, CfgJob in ipairs(Config.Job.List) do
            if Job == CfgJob.Name and CfgJob.Active == true then
                return true
            end
        end
    end

    return false
end

function Function:WeaponWhitelist(Args)
    for i = 1, #Config.WeaponWhitelist do
        local Weapon = joaat(Config.WeaponWhitelist[i])
        if GetSelectedPedWeapon(Args) == Weapon then
            return false
        end
    end
    return true
end

-- Function

function Function:WaitTimer(Name, Functions, ...)
    if not Config.DefaultAllerts.Allerts[Name] then return end

    if not Timer[Name] then
        Timer[Name] = true
        Functions(...)
        Wait(Config.DefaultAllerts.Delay * 1000)
        Timer[Name] = false
    end
end

function Function:SendTo(Args)
    local SendTo = {}

    for _, Id in ipairs(GetPlayers()) do
        local Job = Framework:GetPlayerJob(Id).Name or Framework:GetPlayerJob().Name

        for _, CheckJob in ipairs(Args) do
            for _, CfgJob in ipairs(Config.Job.List) do
                if Job == CheckJob and Job == CfgJob.Name and CfgJob.Active == true then
                    table.insert(SendTo, Id)
                end
            end
        end
    end

    return SendTo
end

function Function:CheckJob(Args)
    local Job = Framework:GetPlayerJob(Args.Id).Name or Framework:GetPlayerJob().Name

    if Args.SendTo == 'Everyone' or Args.Allert == 'PlayerDowned' then return true end

    for _, CheckJob in ipairs(Args.Job) do
        for _, CfgJob in ipairs(Config.Job.List) do
            if CfgJob.SendAsJob then
                if Job == CheckJob and Job == CfgJob.Name then
                    return true
                end
            else
                if Job == CheckJob and Job == CfgJob.Name then
                    return false
                else
                    return true
                end
            end
        end
    end
end

-- Player & Street & Vehicle & Blip & Badge & WayPoint & Weapon

function Function:StreetName()
    local Street = ''
    local Coords

    if cache.vehicle then
        Coords = GetEntityCoords(cache.vehicle)
    else
        Coords = GetEntityCoords(cache.ped)
    end

    local Street1, Street2 = GetStreetNameAtCoord(Coords.x, Coords.y, Coords.z)

    if Street1 ~= 0 and Street2 ~= 0 then
        Street = GetStreetNameFromHashKey(Street1) .. ' & ' .. GetStreetNameFromHashKey(Street2)
    elseif Street1 ~= 0 then
        Street = GetStreetNameFromHashKey(Street1)
    elseif Street2 ~= 0 then
        Street = GetStreetNameFromHashKey(Street2)
    else
        Street = 'Unknown'
    end

    return Street, Coords
end

function Function:Explosion()
    local Explosions = lib.callback.await('Zoxe_Dispatch:ExplosionEvent', false)

    if not Explosions then return locale('Null'), locale('Null') end

    Type = Explosions.explosionType

    for _, Explosion in ipairs(ModList.Explosion) do
        if _ == Type then
            Data = Explosion
        end
    end

    Utils:ReturnDebug(("{ Explosion Type = %s, Explosion Name = %s }  "):format(
        Type,
        Data
    ))

    return Type, Data
end

function Function:Weapon()
    local Type = exports.ox_inventory:getCurrentWeapon()

    if not Type then return locale('Null'), locale('Null'), locale('Null') end

    local Data = ModList.Weapon[Type.hash].Name
    local Level = ModList.Weapon[Type.hash].Level

    Utils:ReturnDebug()

    Utils:ReturnDebug(("{ Weapon Hash = %s, Weapon Name = %s, Weapon Level = %s, Weapon Serial = %s }  "):format(
        Type.hash,
        Data,
        Level,
        Type.metadata.serial
    ))

    return Type.metadata.serial, Data, locale(Level)
end

function Function:Death(Args)
    if not ModList.Weapon[Args] then
        Data = ModList.Death[Args]
    else
        Data = ModList.Weapon[Args].Name
    end

    Utils:ReturnDebug(("{ Death Hash = %s, Death Name = %s }  "):format(
        Args,
        Data
    ))

    return Args, Data
end

function Function:Blip(Settings, Name, Player)
    if Settings.ShowAll then
        if Settings.EnableBlip then
            local Blip = AddBlipForEntity(Player)

            SetBlipSprite(Blip, Settings.Sprite)
            SetBlipScale(Blip, Settings.Scale)
            SetBlipColour(Blip, Settings.Color)
            SetBlipAsShortRange(Blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Name)
            EndTextCommandSetBlipName(Blip)

            SetTimeout(Config.Settings.AllertTime * 1000, function()
                if DoesBlipExist(Blip) then
                    RemoveBlip(Blip)
                end
            end)
        end

        if Settings.EnableCircleBlip then
            local Blip = AddBlipForRadius(GetEntityCoords(Player), tonumber(Settings.Radius))

            SetBlipColour(Blip, Settings.Color)
            SetBlipAlpha(Blip, 128)

            SetTimeout(Config.Settings.AllertTime * 1000, function()
                if DoesBlipExist(Blip) then
                    RemoveBlip(Blip)
                end
            end)
        end
    elseif Settings.EnableCircleBlip then
        local Blip = AddBlipForRadius(GetEntityCoords(Player), tonumber(Settings.Radius))

        SetBlipColour(Blip, Settings.Color)
        SetBlipAlpha(Blip, 128)

        SetTimeout(Config.Settings.AllertTime * 1000, function()
            if DoesBlipExist(Blip) then
                RemoveBlip(Blip)
            end
        end)
    end
end

function Function:WayPoint(Args)
    SetNewWaypoint(Args.x, Args.y)

    local Check = false
    SetTimeout(Config.Settings.AllertTime * 1000, function()
        while not Check do
            if cache.coords == vector3(Args.x, Args.y, Args.z) then
                DeleteWaypoint()
                Check = true
            end
            Wait(1000)
        end
    end)
end

function Function:VehcileData()
    Args          = GetVehiclePedIsUsing(cache.ped, true)

    local Plate   = GetVehicleNumberPlateText(Args)
    local Vehicle = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(Args)))

    local ClassID = GetVehicleClass(Args)
    local Class   = ModList.Classes[ClassID] or "Unknown"

    return { Plate = Plate, Vehicle = Vehicle, Class = Class }
end

function Function:BadgeNumber(Args)
    local name, surname = string.match(Args, "(%a+)%s(%a+)")
    local number = string.format("%04d", math.random(0, 9999))

    return string.sub(name, 1, 1) .. string.sub(surname, 1, 1) .. number
end

function Function:PlayerName(Cfg)
    local Name = ''

    if Cfg.Name == 'JobName' then
        Name = ("<b> %s </b> - %s"):format(
            Framework:GetPlayerJob(Cfg.Id).Grade_Label or Framework:GetPlayerJob().Grade_Label,
            Framework:GetPlayerName(Cfg.Id) or Framework:GetPlayerName()
        )
    elseif Cfg.Name == 'RpName' then
        Name = ("%s"):format(
            Framework:GetPlayerName(Cfg.Id) or Framework:GetPlayerName()
        )
    elseif Cfg.Name == 'GameName' then
        Name = GetPlayerName(
            Framework:GetPlayerData(Cfg.Id).source or Framework:GetPlayerData().source
        )
    elseif Cfg.Name == 'FakeName' then
        Name = 'Unknown'
    end

    return Name
end

function Function:PlayerNumber(Cfg)
    local Number = ''

    if Cfg.Number == 'RpNumber' then
        Number = lib.callback.await('Zoxe_Dispatch:PlayerPhone', false) --Config.GetPlayerNumber(Framework:GetPlayerData().source)
    elseif Cfg.Number == 'FakeNumber' then
        Number = '+1 (555) Unknown'
    end

    return Number
end

return Function
