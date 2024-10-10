fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'SM Scripts'
description 'sm-gunzone'
version '1.0.0'

client_scripts {
    'client/main.lua'
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
}

dependencies {
    'ox_lib'
}