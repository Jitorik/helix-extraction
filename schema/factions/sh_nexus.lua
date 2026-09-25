FACTION.uniqueID = "nexus"
FACTION.name = "Движение НЕКСУС"
FACTION.desc = "Местное сопротивление, защищающее территорию от иностранного вмешательства."
FACTION.color = Color(200, 50, 50)
FACTION.default = false

FACTION.models = {
    "models/barney.mdl",
    "models/odessa.mdl"
}

FACTION.ranks = {
    [1] = {
        name = "Симпатизант",
        description = "Гражданский помощник",
        salary = 50,
        models = {"models/barney.mdl"},
        weapons = {},
        maxHealth = 80,
        armor = 0
    },
    [2] = {
        name = "Новобранец",
        description = "Стажёр",
        salary = 100,
        models = {"models/barney.mdl"},
        weapons = {"weapon_pistol"},
        maxHealth = 90,
        armor = 15
    },
    [3] = {
        name = "Помощник",
        description = "Начинающий боец",
        salary = 150,
        models = {"models/barney.mdl"},
        weapons = {"weapon_pistol"},
        maxHealth = 100,
        armor = 25
    },
    [4] = {
        name = "Боец",
        description = "Основная боевая единица",
        salary = 200,
        models = {"models/barney.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1"},
        maxHealth = 110,
        armor = 35
    },
    [5] = {
        name = "Старший Боец",
        description = "Командир ячейки",
        salary = 300,
        models = {"models/barney.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1"},
        maxHealth = 120,
        armor = 45
    },
    [6] = {
        name = "Ветеран",
        description = "Опытный боец, наставник",
        salary = 400,
        models = {"models/odessa.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 130,
        armor = 55
    },
    [7] = {
        name = "Специалист",
        description = "Эксперт",
        salary = 450,
        models = {"models/odessa.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 140,
        armor = 65
    },
    [8] = {
        name = "Куратор",
        description = "Руководитель сектора",
        salary = 600,
        models = {"models/odessa.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 150,
        armor = 75
    },
    [9] = {
        name = "Координатор",
        description = "Руководитель региона",
        salary = 900,
        models = {"models/odessa.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 160,
        armor = 85
    },
    [10] = {
        name = "Верховный Координатор",
        description = "Лидер движения",
        salary = 1500,
        models = {"models/odessa.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 180,
        armor = 100
    }
}

FACTION.startRank = 1

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