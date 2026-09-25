FACTION.uniqueID = "aurora"
FACTION.name = "Оперативная Группа АВРОРА"
FACTION.desc = "Международная миротворческая коалиция, направленная на стабилизацию региона и контроль добычи Неодима-Х."
FACTION.color = Color(50, 100, 200)
FACTION.default = false

-- Базовые модели (можно заменить на кастомные)
FACTION.models = {
    "models/police.mdl",
    "models/alyx.mdl"
}

-- Система званий (10 уровней)
FACTION.ranks = {
    [1] = {
        name = "Рядовой",
        description = "Базовая боевая единица",
        salary = 100,
        models = {"models/police.mdl"},
        weapons = {"weapon_pistol"},
        maxHealth = 100,
        armor = 25
    },
    [2] = {
        name = "Рядовой I класса",
        description = "Опытный боец",
        salary = 150,
        models = {"models/police.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1"},
        maxHealth = 110,
        armor = 35
    },
    [3] = {
        name = "Рядовой II класса",
        description = "Старший боец",
        salary = 200,
        models = {"models/police.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1"},
        maxHealth = 120,
        armor = 45
    },
    [4] = {
        name = "Рядовой III класса",
        description = "Ведущий боец",
        salary = 250,
        models = {"models/police.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 130,
        armor = 55
    },
    [5] = {
        name = "Специалист",
        description = "Эксперт в своей области",
        salary = 350,
        models = {"models/alyx.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 140,
        armor = 65
    },
    [6] = {
        name = "Сержант",
        description = "Командир отделения",
        salary = 450,
        models = {"models/alyx.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 150,
        armor = 75
    },
    [7] = {
        name = "Старший сержант",
        description = "Командир взвода",
        salary = 600,
        models = {"models/alyx.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 160,
        armor = 85
    },
    [8] = {
        name = "Лейтенант",
        description = "Заместитель командира отряда",
        salary = 800,
        models = {"models/alyx.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 170,
        armor = 95
    },
    [9] = {
        name = "Капитан",
        description = "Командир отряда",
        salary = 1200,
        models = {"models/alyx.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 180,
        armor = 100
    },
    [10] = {
        name = "Генерал",
        description = "Высшее командование",
        salary = 2000,
        models = {"models/alyx.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 200,
        armor = 100
    }
}

-- Начальное звание для новых персонажей
FACTION.startRank = 1

-- Команды, доступные только этой фракции
FACTION.cmds = {
    "charsetscale",
    "plytransfer"
}

function FACTION:OnCharacterCreated(client, character)
    character:SetData("rank", FACTION.startRank)
    character:SetData("reputation", 0)
end

function FACTION:GetRankName(character)
    local rank = character:GetData("rank", 1)
    return self.ranks[rank] and self.ranks[rank].name or "Неизвестно"
end

function FACTION:GetRankSalary(character)
    local rank = character:GetData("rank", 1)
    return self.ranks[rank] and self.ranks[rank].salary or 0
end