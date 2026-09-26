PLUGIN.name = "Extraction Base"
PLUGIN.description = "Базовый плагин для Extraction RP с фракциями"
PLUGIN.author = "Admin"
PLUGIN.version = "1.0"

print("[Extraction Base] Плагин загружается...")

-- Убедимся, что система фракций существует
if not ix.faction then
    ix.faction = {}
end

if not ix.faction.list then
    ix.faction.list = {}
end

-- Регистрация фракций на верхнем уровне (сразу при загрузке файла)
ix.faction.Add({
    uniqueID = "aurora",
    name = "ОГ АВРОРА",
    desc = "Международная миротворческая коалиция",
    color = Color(50, 100, 200),
    default = false
})

ix.faction.Add({
    uniqueID = "nexus",
    name = "Движение НЕКСУС",
    desc = "Местное сопротивление",
    color = Color(200, 50, 50),
    default = false
})

ix.faction.Add({
    uniqueID = "objective",
    name = "ЧВК ОБЪЕКТИВ",
    desc = "Частная военная компания",
    color = Color(150, 150, 50),
    default = false
})

ix.faction.Add({
    uniqueID = "meridian",
    name = "Консорциум МЕРИДИАН",
    desc = "Добывающая корпорация",
    color = Color(200, 150, 50),
    default = true
})

print("[Extraction Base] Зарегистрировано фракций: " .. #ix.faction.list)
