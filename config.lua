Config = {}

Config.DefaultDuration = 5000
Config.MaxNotifications = 5
Config.DefaultTheme = 'default'

Config.Themes = {
    default = {
        success = {bg = '#22c55e', color = '#ffffff', icon = 'fas fa-check-circle'}, 
        error = {bg = '#ef4444', color = '#ffffff', icon = 'fas fa-times-circle'}, 
        warning = {bg = '#eab308', color = '#ffffff', icon = 'fas fa-exclamation-triangle'},
        info = {bg = '#3b82f6', color = '#ffffff', icon = 'fas fa-info-circle'},
        announcement = {bg = '#f97316', color = '#ffffff', icon = 'fas fa-bullhorn'},
        police = {bg = '#1e3a8a', color = '#ffffff', icon = 'fas fa-user-shield'}, 
        ambulance = {bg = '#b91c1c', color = '#ffffff', icon = 'fas fa-ambulance'},
        mechanic = {bg = '#ca8a04', color = '#ffffff', icon = 'fas fa-tools'},
        taxi = {bg = '#16a34a', color = '#ffffff', icon = 'fas fa-taxi'}
    },
    sida = {
        success = {bg = '#ff5050', color = '#ffffff', icon = '✅'},
        error = {bg = '#ff5050', color = '#ffffff', icon = '❌'},
        warning = {bg = '#ff5050', color = '#ffffff', icon = '⚠️'},
        info = {bg = '#ff5050', color = '#ffffff', icon = 'ℹ️'},
        announcement = {bg = '#ff5050', color = '#ffffff', icon = '📢'},
        police = {bg = '#ff5050', color = '#ffffff', icon = '👮'},
        ambulance = {bg = '#ff5050', color = '#ffffff', icon = '🚑'},
        mechanic = {bg = '#ff5050', color = '#ffffff', icon = '🔧'},
        taxi = {bg = '#ff5050', color = '#ffffff', icon = '🚕'}
    },
    darkTransparent = {
        success = { bg = 'rgba(0, 255, 0, 0.1)', color = '#00ff00', icon = '✅' },
        error = { bg = 'rgba(255, 0, 0, 0.1)', color = '#ff0000', icon = '❌' },
        warning = { bg = 'rgba(255, 255, 0, 0.1)', color = '#ffff00', icon = '⚠️' },
        info = { bg = 'rgba(0, 191, 255, 0.1)', color = '#00bfff', icon = 'ℹ️' },
        announcement = { bg = 'rgba(255, 165, 0, 0.1)', color = '#ffa500', icon = '📢' },
        police = { bg = 'rgba(0, 0, 255, 0.1)', color = '#0000ff', icon = '👮' },
        ambulance = { bg = 'rgba(255, 69, 0, 0.1)', color = '#ff4500', icon = '🚑' },
        mechanic = { bg = 'rgba(255, 215, 0, 0.1)', color = '#ffd700', icon = '🔧' },
        taxi = { bg = 'rgba(50, 205, 50, 0.1)', color = '#32cd32', icon = '🚕' }
    },
    pastel = {
        success = { bg = '#a7f3d0', color = '#065f46', icon = '✅' },
        error = { bg = '#fecaca', color = '#b91c1c', icon = '❌' },
        warning = { bg = '#fef3c7', color = '#92400e', icon = '⚠️' },
        info = { bg = '#bfdbfe', color = '#1e40af', icon = 'ℹ️' },
        announcement = { bg = '#fed7aa', color = '#9a3412', icon = '📢' },
        police = { bg = '#c7d2fe', color = '#312e81', icon = '👮' },
        ambulance = { bg = '#fca5a5', color = '#991b1b', icon = '🚑' },
        mechanic = { bg = '#fde68a', color = '#92400e', icon = '🔧' },
        taxi = { bg = '#d9f99d', color = '#365314', icon = '🚕' }
    },
    holographic = {
        success = { bg = 'linear-gradient(135deg, #00FFFB, #FF00FF)', color = '#ffffff', icon = '✅' },
        error = { bg = 'linear-gradient(135deg, #FF4D00, #FF00D4)', color = '#ffffff', icon = '❌' },
        warning = { bg = 'linear-gradient(135deg, #FFF700, #FFAA00)', color = '#ffffff', icon = '⚠️' },
        info = { bg = 'linear-gradient(135deg, #00D4FF, #0066FF)', color = '#ffffff', icon = 'ℹ️' },
        announcement = { bg = 'linear-gradient(135deg, #FF6600, #FF0066)', color = '#ffffff', icon = '📢' },
        police = { bg = 'linear-gradient(135deg, #001AFF, #00FFFB)', color = '#ffffff', icon = '👮' },
        ambulance = { bg = 'linear-gradient(135deg, #FF0000, #FF6A00)', color = '#ffffff', icon = '🚑' },
        mechanic = { bg = 'linear-gradient(135deg, #FFDD00, #FF00AA)', color = '#ffffff', icon = '🔧' },
        taxi = { bg = 'linear-gradient(135deg, #00FF00, #00AAFF)', color = '#ffffff', icon = '🚕' }
    },
    vibrantTransparent = {
        success = { bg = 'rgba(34, 197, 94, 0.8)', color = '#ffffff', icon = '✅' },
        error = { bg = 'rgba(239, 68, 68, 0.8)', color = '#ffffff', icon = '❌' },
        warning = { bg = 'rgba(234, 179, 8, 0.8)', color = '#ffffff', icon = '⚠️' },
        info = { bg = 'rgba(59, 130, 246, 0.8)', color = '#ffffff', icon = 'ℹ️' },
        announcement = { bg = 'rgba(249, 115, 22, 0.8)', color = '#ffffff', icon = '📢' },
        police = { bg = 'rgba(30, 58, 138, 0.8)', color = '#ffffff', icon = '👮' },
        ambulance = { bg = 'rgba(185, 28, 28, 0.8)', color = '#ffffff', icon = '🚑' },
        mechanic = { bg = 'rgba(202, 138, 4, 0.8)', color = '#ffffff', icon = '🔧' },
        taxi = { bg = 'rgba(22, 163, 74, 0.8)', color = '#ffffff', icon = '🚕' }
    },
    glassmorphism = {
        success = { bg = 'rgba(34, 197, 94, 0.2)', color = '#22c55e', icon = '✅', backdropFilter = 'blur(10px)' },
        error = { bg = 'rgba(239, 68, 68, 0.2)', color = '#ef4444', icon = '❌', backdropFilter = 'blur(10px)' },
        warning = { bg = 'rgba(234, 179, 8, 0.2)', color = '#eab308', icon = '⚠️', backdropFilter = 'blur(10px)' },
        info = { bg = 'rgba(59, 130, 246, 0.2)', color = '#3b82f6', icon = 'ℹ️', backdropFilter = 'blur(10px)' },
        announcement = { bg = 'rgba(249, 115, 22, 0.2)', color = '#f97316', icon = '📢', backdropFilter = 'blur(10px)' },
        police = { bg = 'rgba(30, 58, 138, 0.2)', color = '#1e3a8a', icon = '👮', backdropFilter = 'blur(10px)' },
        ambulance = { bg = 'rgba(185, 28, 28, 0.2)', color = '#b91c1c', icon = '🚑', backdropFilter = 'blur(10px)' },
        mechanic = { bg = 'rgba(202, 138, 4, 0.2)', color = '#ca8a04', icon = '🔧', backdropFilter = 'blur(10px)' },
        taxi = { bg = 'rgba(22, 163, 74, 0.2)', color = '#16a34a', icon = '🚕', backdropFilter = 'blur(10px)' }
    },
    neon = {
        success = {bg = '#39ff14', color = '#000000', icon = '✅'},
        error = {bg = '#ff3131', color = '#000000', icon = '❌'},
        warning = {bg = '#ffff00', color = '#000000', icon = '⚠️'},
        info = {bg = '#00ffff', color = '#000000', icon = 'ℹ️'},
        announcement = {bg = '#ff8c00', color = '#000000', icon = '📢'},
        police = {bg = '#0000ff', color = '#ffffff', icon = '👮'},
        ambulance = {bg = '#ff0000', color = '#ffffff', icon = '🚑'},
        mechanic = {bg = '#ffd700', color = '#000000', icon = '🔧'},
        taxi = {bg = '#00ff00', color = '#000000', icon = '🚕'}
    },
    minimalist = {
        success = {bg = '#ffffff', color = '#22c55e', icon = '✓'},
        error = {bg = '#ffffff', color = '#ef4444', icon = '×'},
        warning = {bg = '#ffffff', color = '#eab308', icon = '!'},
        info = {bg = '#ffffff', color = '#3b82f6', icon = 'i'},
        announcement = {bg = '#ffffff', color = '#f97316', icon = '♪'},
        police = {bg = '#ffffff', color = '#1e3a8a', icon = '☆'},
        ambulance = {bg = '#ffffff', color = '#b91c1c', icon = '+'},
        mechanic = {bg = '#ffffff', color = '#ca8a04', icon = '⚙'},
        taxi = {bg = '#ffffff', color = '#16a34a', icon = '▶'}
    }
}

Config.Sounds = {
    enabled = true,
    volume = 1.5,
    success = 'popup.ogg',
    error = 'popup.ogg',
    warning = 'popup.ogg',
    info = 'popup.ogg',
    police = 'popup.ogg',
}

Config.Animations = {
    enabled = true,
    duration = 300,
    easing = 'easeOutQuart'
}

Config.Position = {
    vertical = 'top',
    horizontal = 'right'
}

Config.Keys = {
    openMenu = 289
}

Config.AdvancedFeatures = {
    stackSimilar = true,
    interactiveButtons = true,
    darkMode = false,
    fontScale = 1.0,
    roundedCorners = true,
    showProgressBar = true,
    allowDismiss = true,
    useBackdropFilter = true
}