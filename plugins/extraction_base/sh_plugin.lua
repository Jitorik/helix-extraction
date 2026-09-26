PLUGIN.name = "Extraction Base"
PLUGIN.description = "Базовый плагин для Extraction RP с фракциями"
PLUGIN.author = "Admin"
PLUGIN.version = "1.0"

-- Регистрация фракций при загрузке плагина
function PLUGIN:Initialize()
    print("[Extraction Base] Инициализация плагина...")
    
    -- Фракция 1: АВРОРА
    ix.faction.Add({
        uniqueID = "aurora",
        name = "ОГ АВРОРА",
        desc = "Международная миротворческая коалиция",
        color = Color(50, 100, 200),
        default = false
    })
    
    -- Фракция 2: НЕКСУС
    ix.faction.Add({
        uniqueID = "nexus",
        name = "Движение НЕКСУС",
        desc = "Местное сопротивление",
        color = Color(200, 50, 50),
        default = false
    })
    
    -- Фракция 3: ОБЪЕКТИВ
    ix.faction.Add({
        uniqueID = "objective",
        name = "ЧВК ОБЪЕКТИВ",
        desc = "Частная военная компания",
        color = Color(150, 150, 50),
        default = false
    })
    
    -- Фракция 4: МЕРИДИАН (по умолчанию)
    ix.faction.Add({
        uniqueID = "meridian",
        name = "Консорциум МЕРИДИАН",
        desc = "Добывающая корпорация",
        color = Color(200, 150, 50),
        default = true
    })
    
    print("[Extraction Base] Зарегистрировано фракций: " .. #ix.faction.list)
end