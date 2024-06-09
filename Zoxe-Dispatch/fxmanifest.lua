fx_version 'cerulean'
game 'gta5'
lua54 'yes'

client_scripts {
    'client/modules/*.lua',
    'client/modules/events/*.lua',
}

shared_script {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared/shared.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/modules/*.lua',
    -- 'server/modules/**/*.lua',
}

dependencies {
    -- 'ox_target',
    'ox_lib',
    'ox_inventory'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/style.css',
    'nui/script.js',
    'nui/event.js',
    'nui/sound.mp3',
    'locales/*.json',
    'shared/utils.lua',
    'shared/function.lua',
    'client/modules/events/modlist.lua',
    'server/bridge/*.lua',
    'client/bridge/*.lua'
}
