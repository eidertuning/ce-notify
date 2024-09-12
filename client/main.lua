local currentTheme = Config.DefaultTheme
local currentPosition = Config.Position
local currentSound = Config.Sounds.enabled
local currentAnimation = Config.Animations.enabled
local advancedFeatures = Config.AdvancedFeatures

function SendNotification(type, text, caption, length, options)
    options = options or {}
    SendNUIMessage({
        action = 'notify',
        type = type,
        text = text,
        caption = caption,
        length = length or Config.DefaultDuration,
        theme = options.theme or currentTheme,
        position = options.position or currentPosition,
        sound = options.sound ~= nil and options.sound or currentSound,
        animation = options.animation ~= nil and options.animation or currentAnimation,
        advancedFeatures = options.advancedFeatures or advancedFeatures
    })
end

function OpenConfigMenu()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openMenu',
        currentTheme = currentTheme,
        currentPosition = currentPosition,
        currentSound = currentSound,
        currentAnimation = currentAnimation,
        advancedFeatures = advancedFeatures,
        themes = Config.Themes,
        positions = {
            {label = 'Arriba a la derecha', value = {vertical = 'top', horizontal = 'right'}},
            {label = 'Arriba a la izquierda', value = {vertical = 'top', horizontal = 'left'}},
            {label = 'Abajo a la derecha', value = {vertical = 'bottom', horizontal = 'right'}},
            {label = 'Abajo a la izquierda', value = {vertical = 'bottom', horizontal = 'left'}}
        }
    })
end

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('updateConfig', function(data, cb)
    currentTheme = data.theme
    currentPosition = data.position
    currentSound = data.sound
    currentAnimation = data.animation
    advancedFeatures = data.advancedFeatures
    
    -- Guardar la configuración en un archivo JSON
    SaveResourceFile(GetCurrentResourceName(), 'config.json', json.encode(data), -1)
    
    SendNotification('success', 'Configuración actualizada', 'Los cambios han sido aplicados y guardados')
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterCommand('notifymenu', function()
    OpenConfigMenu()
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, Config.Keys.openMenu) then
            OpenConfigMenu()
        end
    end
end)

RegisterCommand('testnotify', function(source, args, rawCommand)
    local types = {'success', 'error', 'warning', 'info', 'announcement', 'police', 'ambulance', 'mechanic', 'taxi'}
    for i, type in ipairs(types) do
        Citizen.SetTimeout(i * 1000, function()
            SendNotification(type, 'Este es un mensaje de prueba para ' .. type, 'Notificación de ' .. type:upper(), 5000)
        end)
    end
end, false)

-- Cargar la configuración guardada al iniciar el recurso
Citizen.CreateThread(function()
    local savedConfig = json.decode(LoadResourceFile(GetCurrentResourceName(), 'config.json'))
    if savedConfig then
        currentTheme = savedConfig.theme
        currentPosition = savedConfig.position
        currentSound = savedConfig.sound
        currentAnimation = savedConfig.animation
        advancedFeatures = savedConfig.advancedFeatures
    end
end)

-- Command to send a "police" notification
RegisterCommand('policenotify', function()
    SendNotification('police', 'Este es un mensaje de notificación de la policía', 'Notificación de POLICÍA', 5000)
end, false)
