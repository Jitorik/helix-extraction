-- gamemodes/helix/schema/sh_schema.lua

Schema.name = "Extraction RP"
Schema.description = "Military extraction schema in a single folder"
Schema.author = "Admin"
Schema.version = "1.0"

-- Принудительная регистрация фракции МЕРИДИАН
-- Это решает проблему с загрузкой, когда Helix работает в одной папке
hook.Add("Initialize", "Extraction_ForceFactionLoad", function()
    if not ix or not ix.faction then return end
    
    -- Проверяем, не загружена ли фракция уже
    local exists = false
    for _, f in ipairs(ix.faction.list or {}) do
        if f.uniqueID == "meridian" then 
            exists = true 
            break 
        end
    end

    -- Если нет, регистрируем её вручную
    if not exists then
        local meridian = {
            uniqueID = "meridian",
            name = "Консорциум МЕРИДИАН",
            desc = "Добывающая корпорация (Тест однопапочной структуры)",
            color = Color(200, 150, 50),
            default = true
        }
        
        ix.faction.Add(meridian)
        print("[Extraction] Фракция МЕРИДИАН успешно зарегистрирована в ядре!")
    end
end)

-- Пустые хуки для безопасности
function Schema:PlayerInitialSpawn(client) end
function Schema:PlayerSpawn(client) end
