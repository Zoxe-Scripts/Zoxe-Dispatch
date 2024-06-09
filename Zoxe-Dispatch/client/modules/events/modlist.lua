-- https://wiki.rage.mp/index.php?title=Vehicle_Classes
local Classes = {
    [0] = "Compacts",
    [1] = "Sedans",
    [2] = "SUVs",
    [3] = "Coupes",
    [4] = "Muscle",
    [5] = "Sports Classics",
    [6] = "Sports",
    [7] = "Super",
    [8] = "Motorcycles",
    [9] = "Off-road",
    [10] = "Industrial",
    [11] = "Utility",
    [12] = "Vans",
    [13] = "Cycles",
    [14] = "Boats",
    [15] = "Helicopters",
    [16] = "Planes",
    [17] = "Service",
    [18] = "Emergency",
    [19] = "Military",
    [20] = "Commercial",
    [21] = "Trains"
}

-- https://wiki.rage.mp/index.php?title=Vehicle_Colors
local Colors = {
    [0] = "Metallic Black",
    [1] = "Metallic Graphite Black",
    [2] = "Metallic Black Steel",
    [3] = "Metallic Dark Silver",
    [4] = "Metallic Silver",
    [5] = "Metallic Blue Silver",
    [6] = "Metallic Steel Gray",
    [7] = "Metallic Shadow Silver",
    [8] = "Metallic Stone Silver",
    [9] = "Metallic Midnight Silver",
    [10] = "Metallic Gun Metal",
    [11] = "Metallic Anthracite Grey",
    [12] = "Matte Black",
    [13] = "Matte Gray",
    [14] = "Matte Light Grey",
    [15] = "Util Black",
    [16] = "Util Black Poly",
    [17] = "Util Dark silver",
    [18] = "Util Silver",
    [19] = "Util Gun Metal",
    [20] = "Util Shadow Silver",
    [21] = "Worn Black",
    [22] = "Worn Graphite",
    [23] = "Worn Silver Grey",
    [24] = "Worn Silver",
    [25] = "Worn Blue Silver",
    [26] = "Worn Shadow Silver",
    [27] = "Metallic Red",
    [28] = "Metallic Torino Red",
    [29] = "Metallic Formula Red",
    [30] = "Metallic Blaze Red",
    [31] = "Metallic Graceful Red",
    [32] = "Metallic Garnet Red",
    [33] = "Metallic Desert Red",
    [34] = "Metallic Cabernet Red",
    [35] = "Metallic Candy Red",
    [36] = "Metallic Sunrise Orange",
    [37] = "Metallic Classic Gold",
    [38] = "Metallic Orange",
    [39] = "Matte Red",
    [40] = "Matte Dark Red",
    [41] = "Matte Orange",
    [42] = "Matte Yellow",
    [43] = "Util Red",
    [44] = "Util Bright Red",
    [45] = "Util Garnet Red",
    [46] = "Worn Red",
    [47] = "Worn Golden Red",
    [48] = "Worn Dark Red",
    [49] = "Metallic Dark Green",
    [50] = "Metallic Racing Green",
    [51] = "Metallic Sea Green",
    [52] = "Metallic Olive Green",
    [53] = "Metallic Green",
    [54] = "Metallic Gasoline Blue Green",
    [55] = "Matte Lime Green",
    [56] = "Util Dark Green",
    [57] = "Util Green",
    [58] = "Worn Dark Green",
    [59] = "Worn Green",
    [60] = "Worn Sea Wash",
    [61] = "Metallic Midnight Blue",
    [62] = "Metallic Dark Blue",
    [63] = "Metallic Saxony Blue",
    [64] = "Metallic Blue",
    [65] = "Metallic Mariner Blue",
    [66] = "Metallic Harbor Blue",
    [67] = "Metallic Diamond Blue",
    [68] = "Metallic Surf Blue",
    [69] = "Metallic Nautical Blue",
    [70] = "Metallic Bright Blue",
    [71] = "Metallic Purple Blue",
    [72] = "Metallic Spinnaker Blue",
    [73] = "Metallic Ultra Blue",
    [74] = "Metallic Bright Blue",
    [75] = "Util Dark Blue",
    [76] = "Util Midnight Blue",
    [77] = "Util Blue",
    [78] = "Util Sea Foam Blue",
    [79] = "Uil Lightning blue",
    [80] = "Util Maui Blue Poly",
    [81] = "Util Bright Blue",
    [82] = "Matte Dark Blue",
    [83] = "Matte Blue",
    [84] = "Matte Midnight Blue",
    [85] = "Worn Dark blue",
    [86] = "Worn Blue",
    [87] = "Worn Light blue",
    [88] = "Metallic Taxi Yellow",
    [89] = "Metallic Race Yellow",
    [90] = "Metallic Bronze",
    [91] = "Metallic Yellow Bird",
    [92] = "Metallic Lime",
    [93] = "Metallic Champagne",
    [94] = "Metallic Pueblo Beige",
    [95] = "Metallic Dark Ivory",
    [96] = "Metallic Choco Brown",
    [97] = "Metallic Golden Brown",
    [98] = "Metallic Light Brown",
    [99] = "Metallic Straw Beige",
    [100] = "Metallic Moss Brown",
    [101] = "Metallic Biston Brown",
    [102] = "Metallic Beechwood",
    [103] = "Metallic Dark Beechwood",
    [104] = "Metallic Choco Orange",
    [105] = "Metallic Beach Sand",
    [106] = "Metallic Sun Bleeched Sand",
    [107] = "Metallic Cream",
    [108] = "Util Brown",
    [109] = "Util Medium Brown",
    [110] = "Util Light Brown",
    [111] = "Metallic White",
    [112] = "Metallic Frost White",
    [113] = "Worn Honey Beige",
    [114] = "Worn Brown",
    [115] = "Worn Dark Brown",
    [116] = "Worn straw beige",
    [117] = "Brushed Steel",
    [118] = "Brushed Black Steel",
    [119] = "Brushed Aluminium",
    [120] = "Chrome",
    [121] = "Worn Off White",
    [122] = "Util Off White",
    [123] = "Worn Orange",
    [124] = "Worn Light Orange",
    [125] = "Metallic Securicor Green",
    [126] = "Worn Taxi Yellow",
    [127] = "Police Car Blue",
    [128] = "Matte Green",
    [129] = "Matte Brown",
    [130] = "Worn Orange",
    [131] = "Matte White",
    [132] = "Worn White",
    [133] = "Worn Olive Army Green",
    [134] = "Pure White",
    [135] = "Hot Pink",
    [136] = "Salmon pink",
    [137] = "Metallic Vermillion Pink",
    [138] = "Orange",
    [139] = "Green",
    [140] = "Blue",
    [141] = "Mettalic Black Blue",
    [142] = "Metallic Black Purple",
    [143] = "Metallic Black Red",
    [144] = "hunter green",
    [145] = "Metallic Purple",
    [146] = "Metallic Dark Blue",
    [147] = "Black",
    [148] = "Matte Purple",
    [149] = "Matte Dark Purple",
    [150] = "Metallic Lava Red",
    [151] = "Matte Forest Green",
    [152] = "Matte Olive Drab",
    [153] = "Matte Desert Brown",
    [154] = "Matte Desert Tan",
    [155] = "Matte Foilage Green",
    [156] = "Default Alloy Color",
    [157] = "Epsilon Blue",
    [158] = "Pure Gold",
    [159] = "Brushed Gold",
    [160] = "MP100"
}

-- https://wiki.rage.mp/index.php?title=Explosions
local Explosion = {
    [0] = "Grenade",
    [1] = "Grenade Launcher",
    [2] = "Sticky Bomb",
    [3] = "Molotov",
    [4] = "Rocket",
    [5] = "Tank Shell",
    [6] = "Hi Octane",
    [7] = "Car",
    [8] = "Plane",
    [9] = "Petrol Pump",
    [10] = "Bike",
    [11] = "Steam",
    [12] = "Flame",
    [13] = "Water Hydrant",
    [14] = "Gas Canister",
    [15] = "Boat",
    [16] = "Ship Destroy",
    [17] = "Truck",
    [18] = "Bullet",
    [19] = "Smoke Grenade Launcher",
    [20] = "Smoke Grenade",
    [21] = "Bz Gas",
    [22] = "Flare",
    [23] = "Gas Canister",
    [24] = "Extinguisher",
    [25] = "Programmablear",
    [26] = "Train",
    [27] = "Barrel",
    [28] = "Propane",
    [29] = "Blimp",
    [30] = "Flame Explode",
    [31] = "Tanker",
    [32] = "Plane Rocket",
    [33] = "Vehicle Bullet",
    [34] = "Gas Tank",
    [35] = "Bird Crap",
    [36] = "Railgun",
    [37] = "Blimp2",
    [38] = "Firework",
    [39] = "Snowball",
    [40] = "Proxmine",
    [41] = "Valkyrie Cannon",
    [42] = "Air Defense",
    [43] = "Pipebomb",
    [44] = "Vehiclemine",
    [45] = "Explosiveammo",
    [46] = "Apcshell",
    [47] = "Bomb Cluster",
    [48] = "Bomb Gas",
    [49] = "Bomb Incendiary",
    [50] = "Bomb Standard",
    [51] = "Torpedo",
    [52] = "Torpedo Underwater",
    [53] = "Bombushka Cannon",
    [54] = "Bomb Cluster Secondary",
    [55] = "Hunter Barrage",
    [56] = "Hunter Cannon",
    [57] = "Rogue Cannon",
    [58] = "Mine Underwater",
    [59] = "Orbital Cannon",
    [60] = "Bomb Standard Wide",
    [61] = "Explosiveammo Shotgun",
    [62] = "Oppressor2 Cannon",
    [63] = "Mortar Kinetic",
    [64] = "Vehiclemine Kinetic",
    [65] = "Vehiclemine Emp",
    [66] = "Vehiclemine Spike",
    [67] = "Vehiclemine Slick",
    [68] = "Vehiclemine Tar",
    [69] = "Script Drone",
    [70] = "Raygun",
    [71] = "Buriedmine",
    [72] = "Script Missile"
}

-- https://wiki.rage.mp/index.php?title=Weapons
local Weapon = {
    [911657153] = { Name = "Taser", Level = "Light" },
    [453432689] = { Name = "Pistol", Level = "Medium" },
    [736523883] = { Name = "SMG", Level = "Medium" },
    [-1075685676] = { Name = "Combat Pistol", Level = "Medium" },
    [1593441988] = { Name = "Combat Pistol", Level = "Medium" },
    [-1716589765] = { Name = "Pistol .50", Level = "Medium" },
    [-1045183535] = { Name = "Revolver", Level = "Medium" },
    [-86904375] = { Name = "Heavy Revolver", Level = "Heavy" },
    [3249783761] = { Name = "AP Pistol", Level = "Medium" },
    [-879347409] = { Name = "Stun Gun", Level = "Light" },
    [487013001] = { Name = "Pump Shotgun", Level = "Medium" },
    [2017895192] = { Name = "Sawn-Off Shotgun", Level = "Light" },
    [-494615257] = { Name = "Assault Shotgun", Level = "Heavy" },
    [-1654528753] = { Name = "Bullpup Shotgun", Level = "Medium" },
    [984333226] = { Name = "Heavy Shotgun", Level = "Heavy" },
    [171789620] = { Name = "Double Barrel Shotgun", Level = "Heavy" },
    [3220176749] = { Name = "Assault Rifle", Level = "Heavy" },
    [-2084633992] = { Name = "Carbine Rifle", Level = "Heavy" },
    [-1357824103] = { Name = "Advanced Rifle", Level = "Heavy" },
    [-1063057011] = { Name = "Special Carbine", Level = "Heavy" },
    [-120179019] = { Name = "Bullpup Rifle", Level = "Heavy" },
    [2132975508] = { Name = "Sniper Rifle", Level = "Heavy" },
    [100416529] = { Name = "Heavy Sniper", Level = "Heavy" },
    [205991906] = { Name = "Heavy Sniper Mk II", Level = "Heavy" },
    [-952879014] = { Name = "Marksman Rifle", Level = "Heavy" },
    [-1466123874] = { Name = "Grenade", Level = "Light" },
    [1672152130] = { Name = "Grenade Launcher", Level = "Heavy" },
    [2982836145] = { Name = "RPG", Level = "Heavy" },
    [-1312131151] = { Name = "Minigun", Level = "Heavy" },
    [-344484018] = { Name = "Firework Launcher", Level = "Heavy" },
    [-1813897027] = { Name = "Flare Gun", Level = "Light" },
    [615608432] = { Name = "Nightstick", Level = "Light" },
    [1737195953] = { Name = "Crowbar", Level = "Light" },
    [1317494643] = { Name = "Baseball Bat", Level = "Light" },
    [-2067956739] = { Name = "Golf Club", Level = "Light" },
    [1141786504] = { Name = "Knife", Level = "Light" },
    [3638508604] = { Name = "Machete", Level = "Light" },
    [-581044007] = { Name = "Switchblade", Level = "Light" },
    [940833800] = { Name = "Hammer", Level = "Light" }
}

-- https://wiki.rage.mp/index.php?title=Causes_of_death
local Death = {
    [0] = "Suicide",
    [1128792064] = "Flight",
    [2741846334] = "Invested",
    [3750660587] = "Burned",
}

return { Classes = Classes, Colors = Colors, Explosion = Explosion, Weapon = Weapon, Death = Death }