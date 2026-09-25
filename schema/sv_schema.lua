-- Интеграция системы званий и зарплат

-- Переопределяем функцию зарплаты с учётом званий
function Schema:GetSalary(client, character)
    local faction = character:GetFaction()
    
    if faction and faction.GetRankSalary then
        return faction:GetRankSalary(character)
    end
    
    return 0
end

-- Обновляем таймер зарплаты
function Schema:StartSalaryTimer(client)
    local character = client:GetCharacter()
    if not character then return end
    
    local charID = character:GetID()
    
    if salaryTimers[charID] then
        timer.Remove("Salary_" .. charID)
    end
    
    timer.Create("Salary_" .. charID, self.config.salaryInterval, 0, function()
        if IsValid(client) and client:GetCharacter() then
            local character = client:GetCharacter()
            local salary = self:GetSalary(client, character)
            
            if salary > 0 then
                character:GiveMoney(salary)
                client:Notify("Вы получили зарплату: $" .. salary)
            end
        end
    end)
    
    salaryTimers[charID] = true
end

-- Команды для управления званиями
function Schema:PromoteCharacter(client, target, rank)
    local character = target:GetCharacter()
    if not character then return false, "Цель не имеет персонажа" end
    
    local faction = character:GetFaction()
    if not faction or not faction.ranks then return false, "Фракция не имеет системы званий" end
    
    if rank < 1 or rank > #faction.ranks then
        return false, "Неверный уровень звания"
    end
    
    character:SetData("rank", rank)
    target:Notify("Вас повысили до звания: " .. faction.ranks[rank].name)
    client:Notify(target:Name() .. " повышен до: " .. faction.ranks[rank].name)
    
    return true
end

-- Хук для отображения звания в чате
function Schema:PlayerSay(client, text)
    local character = client:GetCharacter()
    if not character then return end
    
    local faction = character:GetFaction()
    if faction and faction.GetRankName then
        local rankName = faction:GetRankName(character)
        -- Можно добавить префикс звания в чат
        -- Например: [Рядовой] Игрок: текст
    end
end