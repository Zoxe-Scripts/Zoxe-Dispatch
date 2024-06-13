function OpenDispatch()
    SendNUIMessage({
        type = 'Zoxe_Dispatch:Open',
    })

    SetNuiFocus(true, true)

    if Config.Settings.MouseInput then
        SetNuiFocusKeepInput(true)
    end
end

function CloseDispatch()
    SendNUIMessage({
        type = 'Zoxe_Dispatch:Close',
    })

    SetNuiFocus(false, false)

    if Config.Settings.MouseInput then
        SetNuiFocusKeepInput(false)
    end
end

function FirstOpenDispatch()
    if not Check then
        OpenDispatch()
        NewPlayerDispatch(Function:PlayerName(
            { Name = 'JobName' }
        ))
        Check = true
    else
        OpenDispatch()
    end
end

function ResponseDispatch(Data)
    SendNUIMessage({
        type = 'Zoxe_Dispatch:Response',
        data = {
            Element = Data.Element
        }
    })

    Function:WayPoint(Data.Data)
end

function DeleteDispatch(Data)
    SendNUIMessage({
        type = 'Zoxe_Dispatch:Delete',
        data = {
            Element = Data.Element
        }
    })
end

function PlayerListsDispatch(Data)
    local PlayerLists = lib.callback.await('Zoxe_Dispatch:PlayerLists', false)

    if json.encode(PlayerLists) == '[]' or PlayerLists == nil then return end

    SendNUIMessage({
        type = 'Zoxe_Dispatch:PlayerLists',
        data = {
            Element = Data.Element,
            PlayerLists = PlayerLists
        }
    })
end

function NewPlayerDispatch(Data)
    local Code = Function:BadgeNumber(Data)
    SendNUIMessage({
        type = 'Zoxe_Dispatch:NewPlayer',
        data = {
            NewPlayer = {
                Code = Code,
                Title = Data
            }
        }
    })
end

function NewAllertDispatch(Data)
    SendNUIMessage({
        type = 'Zoxe_Dispatch:NewAllert',
        data = {
            NewAllert = {
                Icon = Data.Icon,
                Code = Data.Code,
                Title = Data.Title,
                Location = Data.Location,
                Coords = Data.Coords,
                Object = Data.Object,
                Message = Data.Message,
                Sound = Data.Sound or true,
                SendTo = Data.SendTo,
                Job = Data.Job,
                MaxAllertsList = Data.MaxAllertsList or Config.Settings.MaxAllertsList,
                AllertShow = Data.AllertShow or Config.Settings.AllertShow,
                PanicButtons = Data.PanicButtons
            }
        }
    })
end

function ReloadDispatch()
    SendNUIMessage({
        type = 'Zoxe_Dispatch:Reload'
    })
end

function ShowDispatch()
    SendNUIMessage({
        type = 'Zoxe_Dispatch:Show'
    })
end

function SoundDispatch()
    SendNUIMessage({
        type = 'Zoxe_Dispatch:Sound'
    })
end

function PlayerInfoDispatch(Data)
    local Cfg = Config.AllertType['NewAllertDispatch']

    local Ped = cache.ped
    local PlayerId = cache.playerId
    local ServerId = cache.serverId

    local Name = Function:PlayerName(Data.Name or Cfg)
    local Number = Function:PlayerNumber(Data.Number or Cfg)

    local Object1, NameObject1, TypeObject = Function:Weapon()
    local Object2, NameObject2 = Function:Explosion()
    local Location, Coords = Function:StreetName()
    local Vehcile = Function:VehcileData()

    return {
        Ped = Ped,
        PlayerId = PlayerId,
        ServerId = ServerId,
        Name = Name,
        Number = Number,
        Street = {
            Location = Location,
            Coords = Coords
        },
        Weapon = {
            Object = Object1,
            NameObject = NameObject1,
            TypeObject = TypeObject
        },
        Explosion = {
            Object = Object2,
            NameObject = NameObject2
        },
        Vehcile = Vehcile
    }
end

exports('NewAllertDispatch', Allerts.NewAllertDispatch)
exports('PlayerInfoDispatch', PlayerInfoDispatch)
