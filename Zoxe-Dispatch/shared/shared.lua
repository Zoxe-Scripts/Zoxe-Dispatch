Config = {}

Config.ReturnDebug = true

Config.Settings = {
    MouseInput = false,     -- Set MouseInput for Allert
    OpenDispatch = 'L',     -- Set OpenDispatch for Allert
    AllertTime = 5,         -- Set AllertTime for Allert
    AllertShow = 5,         -- Set AllertShow for Allert
    MaxAllertsList = false, -- Set MaxAllertsList or true or false for MaxAllertsList
    PlayerLists = 'RpName'  -- RpName or GameName
}

Config.Job = {
    Table = 'job_grades',                                         -- Not Touch This
    List = {
        { Name = 'police',    Active = true, SendAsJob = false }, -- Set true or false for SendAsJob and Active
        { Name = 'ambulance', Active = true, SendAsJob = false }, -- Set true or false for SendAsJob and Active
    }
}

Config.DefaultAllerts = {
    Delay = 5,  -- Set Delay for DefaultAllerts
    Allerts = { -- Set true or false for DefaultAllerts
        Shooting = true,
        VehicleSpeed = true,
        VehicleTheft = true,
        VehicleJacking = true,
        Fight = true,
        PlayerDowned = true,
        Explosion = true
    }
}

Config.AllertType = {

    -- LSPD
    ['Shooting'] = {
        Name = 'RpName',             -- RpName or GameName or FakeName
        Number = 'RpNumber',         -- RpNumber or FakeNumber
        Blip = {
            EnableBlip = true,       -- Set true or false for EnableBlip
            EnableCircleBlip = true, -- Set true or false for EnableCircleBlip
            ShowAll = true,          -- Set true or false for ShowAll
            Sprite = 156,            -- Set Blip Id
            Scale = 0.8,             -- Set Blip Scale
            Color = 2,               -- Set Blip Color
            Radius = 50.0,           -- Set Blip Radius
        },
    },
    ['VehicleShooting'] = {
        Name = 'RpName',
        Number = 'RpNumber',
        Blip = {
            EnableBlip = true,
            EnableCircleBlip = true,
            ShowAll = true,
            Sprite = 229,
            Scale = 0.8,
            Color = 2,
            Radius = 50.0,
        },
    },
    ['Fight'] = {
        Name = 'RpName',
        Number = 'RpNumber',
        Blip = {
            EnableBlip = true,
            EnableCircleBlip = true,
            ShowAll = true,
            Sprite = 480,
            Scale = 0.8,
            Color = 2,
            Radius = 50.0,
        },
    },
    ['VehicleJacking'] = {
        Name = 'RpName',
        Number = 'RpNumber',
        Blip = {
            EnableBlip = true,
            EnableCircleBlip = true,
            ShowAll = true,
            Sprite = 315,
            Scale = 0.8,
            Color = 2,
            Radius = 50.0,
        },
    },
    ['VehicleTheft'] = {
        Name = 'RpName',
        Number = 'RpNumber',
        Blip = {
            EnableBlip = true,
            EnableCircleBlip = true,
            ShowAll = true,
            Sprite = 315,
            Scale = 0.8,
            Color = 2,
            Radius = 50.0,
        },
    },
    ['Explosion'] = {
        Name = 'RpName',
        Number = 'RpNumber',
        Blip = {
            EnableBlip = true,
            EnableCircleBlip = true,
            ShowAll = true,
            Sprite = 488,
            Scale = 0.8,
            Color = 2,
            Radius = 50.0,
        },
    },
    ['VehicleSpeed'] = {
        Name = 'RpName',
        Number = 'RpNumber',
        Blip = {
            EnableBlip = true,
            EnableCircleBlip = true,
            ShowAll = true,
            Sprite = 488,
            Scale = 0.8,
            Color = 2,
            Radius = 50.0,
        },
    },

    -- EMS
    ['PlayerDowned'] = {
        Name = 'RpName',             -- RpName or GameName or FakeName
        Number = 'RpNumber',         -- RpNumber or FakeNumber
        Blip = {
            EnableBlip = true,       -- Set true or false for EnableBlip
            EnableCircleBlip = true, -- Set true or false for EnableCircleBlip
            ShowAll = true,          -- Set true or false for ShowAll
            Sprite = 488,            -- Set Blip Id
            Scale = 0.8,             -- Set Blip Scale
            Color = 2,               -- Set Blip Color
            Radius = 50.0,           -- Set Blip Radius
        },
    },

    -- LSPD/EMS
    ['PanicButton'] = {
        Name = 'RpName',              -- RpName or GameName or FakeName
        Number = 'RpNumber',          -- RpNumber or FakeNumber
        Blip = {
            EnableBlip = true,        -- Set true or false for EnableBlip
            EnableCircleBlip = false, -- Set true or false for EnableCircleBlip
            ShowAll = true,           -- Set true or false for ShowAll
            Sprite = 458,             -- Set Blip Id
            Scale = 0.8,              -- Set Blip Scale
            Color = 2,                -- Set Blip Color
            Radius = 50.0,            -- Set Blip Radius
        },
    }
}

Config.WeaponWhitelist = {
    'WEAPON_STUNGUN',
    'WEAPON_PISTOL'
}


Config.GetPlayerNumber = function(src)
    if Utils:Resource() == 'QS' then
        local Phone = exports['qs-base']:GetPlayerPhone(src)
        return Phone
    elseif Utils:Resource() == 'LB' then
        local Phone = exports['lb-phone']:GetEquippedPhoneNumber(src)
        return Phone
    elseif Utils:Resource() == 'QB' then
        local Player = QBCore.Functions.GetPlayer(src)
        local Phone = Player.PlayerData.charinfo.phone
        return Phone
    end
end

Config.GetPlayerDeath = function(Ped)
    if Utils:Resource() == 'Ars' then
        return exports.ars_ambulancejob:isDead()
    elseif Utils:Resource() == 'Esx' then
        return IsEntityDead(Ped)
    else
        return print('Put Your Logic / exports')
    end
end
