Allerts = {}

function Allerts.PanicButton()
    local Cfg = Config.AllertType['PanicButton']

    local Ped = cache.ped
    local PlayerId = cache.playerId
    local ServerId = cache.serverId
    local Name = Function:PlayerName(Cfg)
    local Number = Function:PlayerNumber(Cfg)
    local Location, Coords = Function:StreetName()

    local Blip = ("%s | %s"):format(
        locale('Panic_Blip'),
        Name
    )

    TriggerServerEvent('Zoxe_Dispatch:Post', {
        Function = 'NewAllertDispatch',
        Args = {
            Icon = 'tower-broadcast',
            Code = '10-33',
            Title = locale('Panic_Title'),
            Location = Location,
            Coords = Coords,
            Object = ("%s | %s"):format(
                Name,
                Number
            ),
            Message = locale('Panic_Message'),
            Sound = true,
            SendTo = 'Everyone',
            PanicButtons = true
        },
        Other = {
            Ped = Ped,
            PlayerId = PlayerId,
            ServerId = ServerId,
            Cfg = Cfg,
            Blip = Blip,
            Allert = debug.getinfo(1, 'n').name
        }
    })
end

function Allerts.Shooting()
    local Cfg = Config.AllertType['Shooting']

    local Ped = cache.ped
    local PlayerId = cache.playerId
    local ServerId = cache.serverId
    local Name = Function:PlayerName(Cfg)
    local Number = Function:PlayerNumber(Cfg)
    local Location, Coords = Function:StreetName()
    local Object, NameObject, TypeObject = Function:Weapon()

    local Blip = locale('Shooting_Blip')

    TriggerServerEvent('Zoxe_Dispatch:Post', {
        Function = 'NewAllertDispatch',
        Args = {
            Icon = 'person-rifle',
            Code = '10-11',
            Title = locale('Shooting_Title'),
            Location = Location,
            Coords = Coords,
            Object = ("%s | %s (%s)"):format(
                TypeObject,
                NameObject,
                Object
            ),
            Message = locale('Shooting_Message'),
            Sound = true,
            SendTo = 'Job',
            Job = {
                'police',
            }
        },
        Other = {
            Ped = Ped,
            PlayerId = PlayerId,
            ServerId = ServerId,
            Cfg = Cfg,
            Blip = Blip,
            Allert = debug.getinfo(1, 'n').name
        }
    })
end

function Allerts.VehicleShooting()
    local Cfg = Config.AllertType['VehicleShooting']

    local Ped = cache.ped
    local PlayerId = cache.playerId
    local ServerId = cache.serverId
    local Name = Function:PlayerName(Cfg)
    local Number = Function:PlayerNumber(Cfg)
    local Location, Coords = Function:StreetName()

    local Blip = locale('VehicleShooting_Blip')

    TriggerServerEvent('Zoxe_Dispatch:Post', {
        Function = 'NewAllertDispatch',
        Args = {
            Icon = 'gun',
            Code = '10-60',
            Title = locale('VehicleShooting_Title'),
            Location = Location,
            Coords = Coords,
            Object = ("%s | %s"):format(
                Name,
                Number
            ),
            Message = locale('VehicleShooting_Message'),
            Sound = true,
            SendTo = 'Job',
            Job = {
                'police',
            }
        },
        Other = {
            Ped = Ped,
            PlayerId = PlayerId,
            ServerId = ServerId,
            Cfg = Cfg,
            Blip = Blip,
            Allert = debug.getinfo(1, 'n').name
        }
    })
end

function Allerts.Fight()
    local Cfg = Config.AllertType['Fight']

    local Ped = cache.ped
    local PlayerId = cache.playerId
    local ServerId = cache.serverId
    local Name = Function:PlayerName(Cfg)
    local Number = Function:PlayerNumber(Cfg)
    local Location, Coords = Function:StreetName()

    local Blip = locale('Fight_Blip')

    TriggerServerEvent('Zoxe_Dispatch:Post', {
        Function = 'NewAllertDispatch',
        Args = {
            Icon = 'hand-fist',
            Code = '10-10',
            Title = locale('Fight_Title'),
            Location = Location,
            Coords = Coords,
            Object = ("%s | %s"):format(
                Name,
                Number
            ),
            Message = locale('Fight_Message'),
            Sound = true,
            SendTo = 'Job',
            Job = {
                'police',
            }
        },
        Other = {
            Ped = Ped,
            PlayerId = PlayerId,
            ServerId = ServerId,
            Cfg = Cfg,
            Blip = Blip,
            Allert = debug.getinfo(1, 'n').name
        }
    })
end

function Allerts.VehicleJacking()
    local Cfg = Config.AllertType['VehicleJacking']

    local Ped = cache.ped
    local PlayerId = cache.playerId
    local ServerId = cache.serverId
    local Name = Function:PlayerName(Cfg)
    local Number = Function:PlayerNumber(Cfg)
    local Location, Coords = Function:StreetName()
    local Vehcile = Function:VehcileData()

    local Blip = locale('VehicleJacking_Blip')

    TriggerServerEvent('Zoxe_Dispatch:Post', {
        Function = 'NewAllertDispatch',
        Args = {
            Icon = 'car-on',
            Code = '10-35',
            Title = locale('VehicleJacking_Title'),
            Location = Location,
            Coords = Coords,
            Object = ("<b> %s </b> (%s) | %s"):format(
                Vehcile.Vehicle,
                Vehcile.Class,
                Vehcile.Plate
            ),
            Message = locale('VehicleJacking_Message'),
            Sound = true,
            SendTo = 'Job',
            Job = {
                'police',
            }
        },
        Other = {
            Ped = Ped,
            PlayerId = PlayerId,
            ServerId = ServerId,
            Cfg = Cfg,
            Blip = Blip,
            Allert = debug.getinfo(1, 'n').name
        }
    })
end

function Allerts.VehicleTheft()
    local Cfg = Config.AllertType['VehicleTheft']

    local Ped = cache.ped
    local PlayerId = cache.playerId
    local ServerId = cache.serverId
    local Name = Function:PlayerName(Cfg)
    local Number = Function:PlayerNumber(Cfg)
    local Location, Coords = Function:StreetName()
    local Vehcile = Function:VehcileData()

    local Blip = locale('VehicleTheft_Blip')

    TriggerServerEvent('Zoxe_Dispatch:Post', {
        Function = 'NewAllertDispatch',
        Args = {
            Icon = 'car-tunnel',
            Code = '10-35',
            Title = locale('VehicleTheft_Title'),
            Location = Location,
            Coords = Coords,
            Object = ("<b> %s </b> (%s) | %s"):format(
                Vehcile.Vehicle,
                Vehcile.Class,
                Vehcile.Plate
            ),
            Message = locale('VehicleTheft_Message'),
            Sound = true,
            SendTo = 'Job',
            Job = {
                'police',
            }
        },
        Other = {
            Ped = Ped,
            PlayerId = PlayerId,
            ServerId = ServerId,
            Cfg = Cfg,
            Blip = Blip,
            Allert = debug.getinfo(1, 'n').name
        }
    })
end

function Allerts.VehicleSpeed()
    local Cfg = Config.AllertType['VehicleSpeed']

    local Ped = cache.ped
    local PlayerId = cache.playerId
    local ServerId = cache.serverId
    local Name = Function:PlayerName(Cfg)
    local Number = Function:PlayerNumber(Cfg)
    local Location, Coords = Function:StreetName()
    local Vehcile = Function:VehcileData()

    local Blip = locale('VehicleSpeed_Blip')

    TriggerServerEvent('Zoxe_Dispatch:Post', {
        Function = 'NewAllertDispatch',
        Args = {
            Icon = 'car-on',
            Code = '10-35',
            Title = locale('VehicleSpeed_Title'),
            Location = Location,
            Coords = Coords,
            Object = ("<b> %s </b> (%s) | %s"):format(
                Vehcile.Vehicle,
                Vehcile.Class,
                Vehcile.Plate
            ),
            Message = locale('VehicleSpeed_Message'),
            Sound = true,
            SendTo = 'Job',
            Job = {
                'police',
            }
        },
        Other = {
            Ped = Ped,
            PlayerId = PlayerId,
            ServerId = ServerId,
            Cfg = Cfg,
            Blip = Blip,
            Allert = debug.getinfo(1, 'n').name
        }
    })
end

function Allerts.Explosion()
    local Cfg = Config.AllertType['Explosion']

    local Ped = cache.ped
    local PlayerId = cache.playerId
    local ServerId = cache.serverId
    local Name = Function:PlayerName(Cfg)
    local Number = Function:PlayerNumber(Cfg)
    local Location, Coords = Function:StreetName()
    local Object, NameObject = Function:Explosion()

    local Blip = locale('Explosion_Blip')

    TriggerServerEvent('Zoxe_Dispatch:Post', {
        Function = 'NewAllertDispatch',
        Args = {
            Icon = 'fire',
            Code = '10-35',
            Title = locale('Explosion_Title'),
            Location = Location,
            Coords = Coords,
            Object = ("<b> %s </b> (%s)"):format(
                NameObject,
                Object
            ),
            Message = locale('Explosion_Message'),
            Sound = true,
            SendTo = 'Job',
            Job = {
                'police',
            }
        },
        Other = {
            Ped = Ped,
            PlayerId = PlayerId,
            ServerId = ServerId,
            Cfg = Cfg,
            Blip = Blip,
            Allert = debug.getinfo(1, 'n').name
        }
    })
end

function Allerts.PlayerDowned(reason)
    local Cfg = Config.AllertType['PlayerDowned']

    local Ped = cache.ped
    local PlayerId = cache.playerId
    local ServerId = cache.serverId
    local Name = Function:PlayerName(Cfg)
    local Number = Function:PlayerNumber(Cfg)
    local Location, Coords = Function:StreetName()
    local Object, NameObject = Function:Death(reason)

    if Framework:GetPlayerJob().Name == Config.Job.List[1].Name then
        local Blip = locale('InjuredPolice_Blip')

        TriggerServerEvent('Zoxe_Dispatch:Post', {
            Function = 'NewAllertDispatch',
            Args = {
                Icon = 'user-injured',
                Code = '10-35',
                Title = locale('InjuredPolice_Title'),
                Location = Location,
                Coords = Coords,
                Object = ("%s | <b> %s </b> (%s)"):format(
                    Name,
                    NameObject,
                    Object
                ),
                Message = locale('InjuredPolice_Message'),
                Sound = true,
                SendTo = 'Job',
                Job = {
                    'ambulance',
                }
            },
            Other = {
                Ped = Ped,
                PlayerId = PlayerId,
                ServerId = ServerId,
                Cfg = Cfg,
                Blip = Blip,
                Allert = debug.getinfo(1, 'n').name
            }
        })
    elseif Framework:GetPlayerJob().Name == Config.Job.List[2].Name then
        local Blip = locale('InjuredAmbulance_Blip')

        TriggerServerEvent('Zoxe_Dispatch:Post', {
            Function = 'NewAllertDispatch',
            Args = {
                Icon = 'user-injured',
                Code = '10-35',
                Title = locale('InjuredAmbulance_Title'),
                Location = Location,
                Coords = Coords,
                Object = ("%s | <b> %s </b> (%s)"):format(
                    Name,
                    NameObject,
                    Object
                ),
                Message = locale('InjuredAmbulance_Message'),
                Sound = true,
                SendTo = 'Job',
                Job = {
                    'ambulance',
                }
            },
            Other = {
                Ped = Ped,
                PlayerId = PlayerId,
                ServerId = ServerId,
                Cfg = Cfg,
                Blip = Blip,
                Allert = debug.getinfo(1, 'n').name
            }
        })
    else
        local Blip = locale('InjuredPerson_Blip')

        TriggerServerEvent('Zoxe_Dispatch:Post', {
            Function = 'NewAllertDispatch',
            Args = {
                Icon = 'user-injured',
                Code = '10-35',
                Title = locale('InjuredPerson_Title'),
                Location = Location,
                Coords = Coords,
                Object = ("%s | <b> %s </b> (%s)"):format(
                    Name,
                    NameObject,
                    Object
                ),
                Message = locale('InjuredPerson_Message'),
                Sound = true,
                SendTo = 'Job',
                Job = {
                    'ambulance',
                }
            },
            Other = {
                Ped = Ped,
                PlayerId = PlayerId,
                ServerId = ServerId,
                Cfg = Cfg,
                Blip = Blip,
                Allert = debug.getinfo(1, 'n').name
            }
        })
    end
end

function Allerts.NewAllertDispatch(Args)
    local Cfg = Config.AllertType['NewAllertDispatch']

    local Ped = cache.ped
    local PlayerId = cache.playerId
    local ServerId = cache.serverId

    local Blip = ("%s"):format(
        Args.Title
    )

    TriggerServerEvent('Zoxe_Dispatch:Post', {
        Function = 'NewAllertDispatch',
        Args = Args,
        Other = {
            Ped = Ped,
            PlayerId = PlayerId,
            ServerId = ServerId,
            Cfg = Cfg,
            Blip = Blip,
            Allert = debug.getinfo(1, 'n').name
        }
    })
end

exports('Allerts', Allerts)
exports('NewAllertDispatch', Allerts.NewAllertDispatch)
