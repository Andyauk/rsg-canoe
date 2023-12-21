fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'rsg-canoe'
version '1.0.0'

client_scripts {
    'client/client.lua',
}

server_scripts {
    'server/server.lua',
}

shared_scripts {
    '@rsg-core/shared/locale.lua',
    'locales/en.lua', -- Change this to your preferred language
    'config.lua',
    '@ox_lib/init.lua'
}

dependencies { 
    'rsg-core',
    'ox_lib'
}

lua54 'yes'