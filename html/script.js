const { useState, useEffect, useRef } = React;

const NotificationIcon = ({ type, icon }) =>
    React.createElement(
        "span",
        { className: "notification-icon" },
        React.createElement("i", { className: icon }), // Render Font Awesome icon
    );

const Notification = ({
    id,
    type,
    title,
    message,
    duration,
    theme,
    position,
    sound,
    animation,
    advancedFeatures,
    onRemove,
}) => {
    const [progress, setProgress] = useState(100);
    const notificationRef = useRef(null);

    useEffect(() => {
        const interval = setInterval(() => {
            setProgress((prevProgress) => {
                if (prevProgress <= 0) {
                    clearInterval(interval);
                    onRemove(id);
                    return 0;
                }
                return prevProgress - 100 / (duration / 10);
            });
        }, 10);

        if (sound) {
            const audio = new Audio(`sounds/${type}.mp3`);
            audio.volume = 0.5;
            audio.play();
        }

        if (animation && notificationRef.current) {
            notificationRef.current.style.animation = "slideIn 0.3s ease-out";
        }

        return () => clearInterval(interval);
    }, [duration, id, onRemove, sound, type, animation]);

    const notificationStyle = {
        backgroundColor: theme && theme[type] ? theme[type].bg : "#333",
        color: theme && theme[type] ? theme[type].color : "#fff",
        borderRadius: advancedFeatures.roundedCorners ? "8px" : "0",
        fontSize: `${advancedFeatures.fontScale}rem`,
    };

    return React.createElement(
        "div",
        {
            ref: notificationRef,
            className: `notification ${type}`,
            style: notificationStyle,
        },
        React.createElement(NotificationIcon, {
            type: type,
            icon: theme && theme[type] ? theme[type].icon : "!",
        }),
        React.createElement(
            "div",
            { className: "notification-content" },
            React.createElement(
                "div",
                { className: "notification-title" },
                title,
            ),
            React.createElement(
                "div",
                { className: "notification-message" },
                message,
            ),
        ),
        advancedFeatures.showProgressBar &&
            React.createElement(
                "div",
                { className: "notification-progress" },
                React.createElement("div", {
                    className: "notification-progress-bar",
                    style: { width: `${progress}%` },
                }),
            ),
        advancedFeatures.allowDismiss &&
            React.createElement(
                "button",
                {
                    className: "notification-dismiss",
                    onClick: () => onRemove(id),
                },
                "×",
            ),
    );
};

const ConfigMenu = ({
    isOpen,
    onClose,
    currentConfig,
    onUpdateConfig,
    themes,
    positions,
}) => {
    const [config, setConfig] = useState(currentConfig);
    const menuRef = useRef(null);

    useEffect(() => {
        const handleClickOutside = (event) => {
            if (menuRef.current && !menuRef.current.contains(event.target)) {
                onClose();
            }
        };

        if (isOpen) {
            document.addEventListener("mousedown", handleClickOutside);
        }

        return () => {
            document.removeEventListener("mousedown", handleClickOutside);
        };
    }, [isOpen, onClose]);

    const handleChange = (key, value) => {
        setConfig((prev) => ({ ...prev, [key]: value }));
    };

    const handleSubmit = () => {
        onUpdateConfig(config);
        onClose();
    };

    if (!isOpen) return null;

    return React.createElement(
        "div",
        { className: "config-menu-overlay" },
        React.createElement(
            "div",
            { className: "config-menu", ref: menuRef },
            React.createElement(
                "h2",
                { className: "config-menu-title" },
                "Configuración de Notificaciones",
            ),
            React.createElement(
                "div",
                { className: "config-section" },
                React.createElement(
                    "h3",
                    { className: "config-section-title" },
                    "Ajustes Generales",
                ),
                React.createElement(
                    "div",
                    { className: "config-option" },
                    React.createElement("label", null, "Tema:"),
                    React.createElement(
                        "select",
                        {
                            value: config.theme,
                            onChange: (e) =>
                                handleChange("theme", e.target.value),
                        },
                        Object.keys(themes).map((theme) =>
                            React.createElement(
                                "option",
                                { key: theme, value: theme },
                                theme,
                            ),
                        ),
                    ),
                ),
                React.createElement(
                    "div",
                    { className: "config-option" },
                    React.createElement("label", null, "Posición:"),
                    React.createElement(
                        "select",
                        {
                            value: JSON.stringify(config.position),
                            onChange: (e) =>
                                handleChange(
                                    "position",
                                    JSON.parse(e.target.value),
                                ),
                        },
                        positions.map((pos) =>
                            React.createElement(
                                "option",
                                {
                                    key: pos.label,
                                    value: JSON.stringify(pos.value),
                                },
                                pos.label,
                            ),
                        ),
                    ),
                ),
                React.createElement(
                    "div",
                    { className: "config-option" },
                    React.createElement("label", null, "Sonido:"),
                    React.createElement("input", {
                        type: "checkbox",
                        checked: config.sound,
                        onChange: (e) =>
                            handleChange("sound", e.target.checked),
                    }),
                ),
                React.createElement(
                    "div",
                    { className: "config-option" },
                    React.createElement("label", null, "Animación:"),
                    React.createElement("input", {
                        type: "checkbox",
                        checked: config.animation,
                        onChange: (e) =>
                            handleChange("animation", e.target.checked),
                    }),
                ),
            ),
            React.createElement(
                "div",
                { className: "config-section" },
                React.createElement(
                    "h3",
                    { className: "config-section-title" },
                    "Características Avanzadas",
                ),
                Object.entries(config.advancedFeatures).map(
                    ([feature, value]) =>
                        React.createElement(
                            "div",
                            { key: feature, className: "config-option" },
                            React.createElement("label", null, feature + ":"),
                            React.createElement("input", {
                                type:
                                    typeof value === "boolean"
                                        ? "checkbox"
                                        : "number",
                                checked:
                                    typeof value === "boolean"
                                        ? value
                                        : undefined,
                                value:
                                    typeof value === "number"
                                        ? value
                                        : undefined,
                                onChange: (e) =>
                                    handleChange("advancedFeatures", {
                                        ...config.advancedFeatures,
                                        [feature]:
                                            typeof value === "boolean"
                                                ? e.target.checked
                                                : parseFloat(e.target.value),
                                    }),
                            }),
                        ),
                ),
            ),
            React.createElement(
                "div",
                { className: "config-buttons" },
                React.createElement(
                    "button",
                    { onClick: handleSubmit, className: "config-button save" },
                    "Guardar",
                ),
                React.createElement(
                    "button",
                    { onClick: onClose, className: "config-button cancel" },
                    "Cancelar",
                ),
            ),
        ),
    );
};

const NotificationSystem = () => {
    const [notifications, setNotifications] = useState([]);
    const [config, setConfig] = useState({
        theme: "default",
        position: { vertical: "top", horizontal: "right" },
        sound: true,
        animation: true,
        advancedFeatures: {
            stackSimilar: true,
            interactiveButtons: true,
            darkMode: false,
            fontScale: 1.0,
            roundedCorners: true,
            showProgressBar: true,
            allowDismiss: true,
            useBackdropFilter: true,
        },
    });
    const [isMenuOpen, setIsMenuOpen] = useState(false);
    const [themes, setThemes] = useState({});
    const [positions, setPositions] = useState([]);

    useEffect(() => {
        window.addEventListener("message", handleMessage);
        return () => window.removeEventListener("message", handleMessage);
    }, []);

    const handleMessage = (event) => {
        const {
            action,
            type,
            text,
            caption,
            length,
            theme,
            position,
            sound,
            animation,
            advancedFeatures,
        } = event.data;
        if (action === "notify") {
            addNotification(type, caption || text, text, length, {
                theme,
                position,
                sound,
                animation,
                advancedFeatures,
            });
        } else if (action === "openMenu") {
            setConfig((prev) => ({
                ...prev,
                theme: event.data.currentTheme,
                position: event.data.currentPosition,
                sound: event.data.currentSound,
                animation: event.data.currentAnimation,
                advancedFeatures: event.data.advancedFeatures,
            }));
            setThemes(event.data.themes);
            setPositions(event.data.positions);
            setIsMenuOpen(true);
        }
    };

    const addNotification = (
        type,
        title,
        message,
        duration = 5000,
        options = {},
    ) => {
        const id = Date.now();
        const newNotification = {
            id,
            type,
            title,
            message,
            duration,
            ...options,
        };
        setNotifications((prev) => {
            if (config.advancedFeatures.stackSimilar) {
                const existingNotification = prev.find(
                    (n) => n.type === type && n.message === message,
                );
                if (existingNotification) {
                    return prev.map((n) =>
                        n.id === existingNotification.id
                            ? { ...n, count: (n.count || 1) + 1 }
                            : n,
                    );
                }
            }
            return [...prev, newNotification].slice(-5);
        });
    };

    const removeNotification = (id) => {
        setNotifications((prev) => prev.filter((n) => n.id !== id));
    };

    const handleUpdateConfig = (newConfig) => {
        setConfig(newConfig);
        fetch("https://ce-notify/updateConfig", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(newConfig),
        }).then(() => {
            setIsMenuOpen(false);
            fetch("https://ce-notify/closeMenu", { method: "POST" });
        });
    };

    const containerStyle = {
        [config.position.vertical]: "20px",
        [config.position.horizontal]: "20px",
    };

    return React.createElement(
        React.Fragment,
        null,
        React.createElement(
            "div",
            {
                className: `notification-container ${config.advancedFeatures.darkMode ? "dark-mode" : ""}`,
                style: containerStyle,
            },
            notifications.map((notification) =>
                React.createElement(Notification, {
                    key: notification.id,
                    ...notification,
                    theme: themes[config.theme],
                    position: config.position,
                    sound: config.sound,
                    animation: config.animation,
                    advancedFeatures: config.advancedFeatures,
                    onRemove: removeNotification,
                }),
            ),
        ),
        React.createElement(ConfigMenu, {
            isOpen: isMenuOpen,
            onClose: () => {
                setIsMenuOpen(false);
                fetch("https://ce-notify/closeMenu", { method: "POST" });
            },
            currentConfig: config,
            onUpdateConfig: handleUpdateConfig,
            themes: themes,
            positions: positions,
        }),
    );
};

ReactDOM.render(
    React.createElement(NotificationSystem),
    document.getElementById("app"),
);

function loadPlayerData() {
    fetch("playerData.json")
        .then((response) => response.json())
        .then((data) => {
            // ... process player data
        });
}
function savePlayerData()

function savePlayerData(data) {
    fetch('playerData.json', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    });
}