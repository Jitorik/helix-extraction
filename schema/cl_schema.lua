-- Клиентская часть встроенной схемы

function Schema:HUDPaint()
    -- Здесь можно рисовать кастомный HUD
    -- Пока оставляем стандартный Helix HUD
end

function Schema:DrawPhysgunBeam(client, physgun, enabled, target, bone, hitpos)
    -- Кастомизация луча физгана (опционально)
    return true -- используем стандартный
end

-- Вызывается при открытии меню персонажа
function Schema:ShowCharacterMenu(client)
    -- Можно переопределить стандартное меню персонажа
    return false -- используем стандартное
end

-- Вызывается для отображения информации о персонаже
function Schema:GetCharacterDescription(character)
    return character:GetDescription()
end

-- Вызывается для отображения имени персонажа
function Schema:GetCharacterName(character)
    return character:GetName()
end

hook.Add("InitPostEntity", "HelixRP_DebugFactions", function()
    local list = ix and ix.faction and ix.faction.list

    if not list then
        print("[Helix RP][DEBUG] ix.faction.list = nil")
        return
    end

    print("[Helix RP][DEBUG] Фракций загружено:", #list)

    for i, v in ipairs(list) do
        print(i, v.uniqueID, v.name, v.index)
    end
end)

-- Принудительная регистрация фракции на клиенте, если серверная синхронизация запаздывает
hook.Add("InitPostEntity", "HelixRP_ForceClientFaction", function()
    if ix and ix.faction and ix.faction.list then
        -- Проверяем, есть ли уже эта фракция
        local found = false
        for _, f in ipairs(ix.faction.list) do
            if f.uniqueID == "test" then
                found = true
                break
            end
        end

        if not found then
            print("[Helix RP] Forcing client-side faction registration...")
            
            -- Создаем таблицу вручную
            local myFaction = {
                uniqueID = "test",
                name = "Test Faction",
                desc = "Forced Client Side",
                color = Color(255, 0, 0),
                default = true,
                index = #ix.faction.list + 1
            }
            
            table.insert(ix.faction.list, myFaction)
            print("[Helix RP] Client faction forced successfully.")
        end
    end
end)