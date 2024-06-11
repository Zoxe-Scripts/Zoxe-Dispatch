Config = {}

Config.ReturnDebug = true

Config.Settings = {
    MouseInput = false,
    OpenDispatch = 'L',
    AllertTime = 5,
    AllertShow = 5,
    MaxAllertsList = false,
    PlayerLists = 'RpName'
}

Config.Job = {
    Table = 'job_grades',
    List = {
        { Name = 'police',    Active = true, SendAsJob = true },
        { Name = 'ambulance', Active = true, SendAsJob = false },
    }
}

Config.DefaultAllerts = {
    Delay = 5,
    Allerts = {
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
        Name = 'RpName',     -- RpName or GameName or FakeName
        Number = 'RpNumber', -- RpNumber or FakeNumber
        Blip = {
            EnableBlip = true,
            EnableCircleBlip = true,
            ShowAll = true,
            Sprite = 156,
            Scale = 0.8,
            Color = 2,
            Radius = 50.0,
        },
    },
    ['VehicleShooting'] = {
        Name = 'RpName',     -- RpName or GameName or FakeName
        Number = 'RpNumber', -- RpNumber or FakeNumber
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
        Name = 'RpName',     -- RpName or GameName or FakeName
        Number = 'RpNumber', -- RpNumber or FakeNumber
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
        Name = 'RpName',     -- RpName or GameName or FakeName
        Number = 'RpNumber', -- RpNumber or FakeNumber
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
        Name = 'RpName',     -- RpName or GameName or FakeName
        Number = 'RpNumber', -- RpNumber or FakeNumber
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
        Name = 'RpName',     -- RpName or GameName or FakeName
        Number = 'RpNumber', -- RpNumber or FakeNumber
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
        Name = 'RpName',     -- RpName or GameName or FakeName
        Number = 'RpNumber', -- RpNumber or FakeNumber
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
        Name = 'RpName',     -- RpName or GameName or FakeName
        Number = 'RpNumber', -- RpNumber or FakeNumber
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

    -- LSPD/EMS
    ['PanicButton'] = {
        Name = 'RpName',     -- RpName or GameName or FakeName
        Number = 'RpNumber', -- RpNumber or FakeNumber
        Blip = {
            EnableBlip = true,
            EnableCircleBlip = false,
            ShowAll = true,
            Sprite = 458,
            Scale = 0.8,
            Color = 2,
            Radius = 50.0,
        },
    }
}

Config.WeaponWhitelist = {
    'WEAPON_STUNGUN',
    -- 'WEAPON_PISTOL'
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
