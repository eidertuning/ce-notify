fx_version 'cerulean'
game 'gta5'

author 'Tu Nombre'
description 'Sistema de Notificaciones Ultra Moderno Standalone para FiveM'
version '3.0.0'

ui_page 'html/index.html'

client_scripts {
    'config.lua',
    'client/main.lua'
}

server_scripts {
    'config.lua',
    'server/main.lua'
}

files {
    'html/index.html',
    'html/styles.css',
    'html/script.js',
    'html/sounds/*.mp3'
}