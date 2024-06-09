> [!CAUTION]
> This Lua script is distributed under the GNU General Public License (GPL).
> You are free to use and modify this script, but you must comply with the terms of the GPL.
> You cannot sell or distribute this script as your own work.
> See https://www.gnu.org/licenses/gpl-3.0.html for the full text of the GPL.

Advanced Dispatch System For Multiple Job

# Zoxe-Dispatch

## Configuration

To configure `Zoxe-Dispatch`, follow these steps:

Open `shared.lua` and `server.cfg` file: This file is usually found in the folder you are about to put.

Add the following lines to your `shared.lua` and `server.cfg` file: These settings allow you to set the language and enable debug mode for troubleshooting purposes.

For any other doubts regarding the translation, if you are a developer you can consult the documentation:

- [`Locales`](https://overextended.dev/ox_lib/Modules/Locale/Shared)

```lua
## Shared
Config.ReturnDebug = true

## Server
setr ox:locale en
```

- Save the file: After making the changes, save and close the `shared.lua` and `server.cfg` files.

- Restart your server: For the changes to take effect, you need to restart your game server.

## Dependency

- [OX LIB](https://github.com/overextended/ox_lib)
- [OX TARGET](https://github.com/overextended/ox_target/tree/main)
- [OX INVENTORY](https://github.com/overextended/ox_inventory)

## Screenshots

<table>
  <tr>
    <td><img src="https://github.com/ENT510/LGF_Banking/assets/145626625/7b5cbcb9-fe60-4828-9d1e-1bdc43fa7560" alt="Manage Banking" width="300"/></td>
    <td><img src="https://github.com/ENT510/LGF_Banking/assets/145626625/fa70a893-f2d4-4d2e-91fc-84704820eeb9" alt="Pin Creation" width="300"/></td>
    <td><img src="https://github.com/ENT510/LGF_Banking/assets/145626625/666fce84-cb7f-4d6a-977d-a32d5fc9b1ba" alt="Create Fake Card" width="300"/></td>
  </tr>
</table>

### Framework Support

- [x] **ESX**
- [x] **LGF**
- [x] **QB (Soon)**

# Features

### Multi Core Support

- Supports: `esx`, `lgf`, `qb`

### Multi Notify System Support

- Supports: `ox`, `esx`, `lgf`, `qb`

### Multi Other System Support

- Supports: `ox`, `esx`, `lgf`, `qb`

<hr style="border-radius: 50%; margin: 0 25px;">

# Items Preconfigured

### Register Item In Ox Inventory

1. **Navigate to the `ox_inventory` folder**:

   - Go to the `data` directory.

2. **Open `items.lua`**:

   - Locate and open the `items.lua` file.

3. **Add the Dispatch Items**:
   - Insert the following Lua table into `items.lua`.

Add this Lua code to the `items.lua` file to register the dispatch items:

```lua
return {
	['dispatch_lspd'] = {
		label = 'Dispatch LSPD',
		weight = 0,
		stack = false
	},
    ['dispatch_ems'] = {
		label = 'Dispatch EMS',
		weight = 0,
		stack = false
	}
}
```

<hr style="border-radius: 50%; margin: 0 25px;">

## Config File Details

### General Settings

```lua
Config = {}

Config.Settings = {
    MouseInput = false,
    OpenDispatch = 'L',
    AllertTime = 5,
    AllertShow = 5,
    MaxAllertsList = false,
    PlayerLists = 'RpName'
}
```

- **MouseInput**: Enables or disables mouse input.
- **OpenDispatch**: Key to open the dispatch system (default is 'L').
- **AllertTime**: Duration for each alert in seconds.
- **AllertShow**: Time to show alerts.
- **MaxAllertsList**: Maximum number of alerts to list.
- **PlayerLists**: Player list display mode ('RpName', 'GameName', 'FakeName').

### Job Configuration

```lua
Config.Job = {
    { Name = 'police',    Active = true, SendAsJob = true },
    { Name = 'ambulance', Active = true, SendAsJob = false },
}
```

- **Name**: Job name.
- **Active**: If the job is active.
- **SendAsJob**: If alerts should be sent as this job.

### Default Alerts

```lua
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
```

- **Delay**: Delay between alerts.
- **Allerts**: List of default alerts enabled or disabled.

### Alert Types

Configure different alert types with custom settings:

```lua
Config.AllertType = {
    ['Shooting'] = {
        Name = 'RpName',
        Number = 'RpNumber',
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
    -- Add other alert types similarly...
}
```

- **Name**: Display name mode.
- **Number**: Display number mode.
- **Blip**: Blip settings including sprite, scale, color, and radius.

### Weapon Whitelist

Specify which weapons are whitelisted:

```lua
Config.WeaponWhitelist = {
    'WEAPON_STUNGUN',
    -- Add more weapons here...
}
```

- **Whitelist / Blacklist**: All weapons outside this list will be blacklisted.

<hr style="border-radius: 50%; margin: 0 25px;">

# All Exports & Events

- **Name**: `NewAllert`, **Utility**: `Use The Export For Create New Allert`
  - **Client Side Exports:**

```lua
exports['Zoxe-Dispatch']:NewAllert(Data)
```

<hr style="border-radius: 50%; margin: 0 25px;">
<br>

- **Name**: `NewAllert`, **Utility**: `Use The Event For Create New Allert`
  - **Client Side Event:**

```lua
    TriggerServerEvent('Zoxe_Dispatch:Post', {
        Function = 'NewAllertDispatch',
        Args = {
            Icon = Icon,
            Code = Code,
            Title = Title,
            Location = Location,
            Coords = Coords,
            Object = Object,
            Message = Message,
            Sound = Sound,
            SendTo = SendTo,
            MaxAllertsList = MaxAllertsList,
            AllertShow = AllertShow,
            PanicButtons = PanicButtons
        },
        Other = {
            Ped = Ped,
            PlayerId = PlayerId,
            ServerId = ServerId,
            Cfg = Cfg,
            Blip = Blip,
            Allert = Allert
        }
    })
```

# Example Usage

```lua
RegisterCommand('Help', function(source, args)
    local Data = {
        Icon = Icon,
        Code = Code,
        Title = Title,
        Location = Location,
        Coords = Coords,
        Object = Object,
        Message = Message,
        Sound = Sound,
        SendTo = SendTo,
        MaxAllertsList = MaxAllertsList,
        AllertShow = AllertShow,
        PanicButtons = PanicButtons
    }

    exports['Zoxe_Dispatch']:NewAllert(Data)
end)

RegisterCommand('Help', function(source, args)
    local Data = {
        Function = 'NewAllertDispatch',
        Args = {
            Icon = Icon,
            Code = Code,
            Title = Title,
            Location = Location,
            Coords = Coords,
            Object = Object,
            Message = Message,
            Sound = Sound,
            SendTo = SendTo,
            MaxAllertsList = MaxAllertsList,
            AllertShow = AllertShow,
            PanicButtons = PanicButtons
        },
        Other = {
            Ped = Ped,
            PlayerId = PlayerId,
            ServerId = ServerId,
            Cfg = Cfg,
            Blip = Blip,
            Allert = Allert
        }
    }

    TriggerServerEvent('Zoxe_Dispatch:Post', Data)
end)
```

<hr style="border-radius: 50%; margin: 0 25px;">
<br>

> [!TIP]
> This format should be clearer and more structured for users to understand how to use your script.