FACTION.uniqueID = "objective"
FACTION.name = "ЧВК ОБЪЕКТИВ"
FACTION.desc = "Частная военная компания, работающая на контрактах."
FACTION.color = Color(150, 150, 50)
FACTION.default = false

FACTION.models = {
    "models/breen.mdl",
    "models/kleiner.mdl"
}

FACTION.ranks = {
    [1] = {
        name = "Кандидат",
        description = "На испытательном сроке",
        salary = 80,
        models = {"models/breen.mdl"},
        weapons = {"weapon_pistol"},
        maxHealth = 90,
        armor = 20
    },
    [2] = {
        name = "Стажёр",
        description = "Новичок",
        salary = 120,
        models = {"models/breen.mdl"},
        weapons = {"weapon_pistol"},
        maxHealth = 100,
        armor = 30
    },
    [3] = {
        name = "Контрактник",
        description = "Боец на контракте",
        salary = 200,
        models = {"models/breen.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1"},
        maxHealth = 110,
        armor = 40
    },
    [4] = {
        name = "Оперативник",
        description = "Опытный наёмник",
        salary = 300,
        models = {"models/breen.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 120,
        armor = 50
    },
    [5] = {
        name = "Заместитель командира",
        description = "Помощник командира",
        salary = 450,
        models = {"models/kleiner.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 130,
        armor = 60
    },
    [6] = {
        name = "Командир отряда",
        description = "Тактическое руководство",
        salary = 650,
        models = {"models/kleiner.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 140,
        armor = 70
    },
    [7] = {
        name = "Старший менеджер",
        description = "Региональный руководитель",
        salary = 900,
        models = {"models/kleiner.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 150,
        armor = 80
    },
    [8] = {
        name = "Менеджер операций",
        description = "Руководитель контрактов",
        salary = 1200,
        models = {"models/kleiner.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 160,
        armor = 90
    },
    [9] = {
        name = "Заместитель директора",
        description = "Второе лицо",
        salary = 1800,
        models = {"models/kleiner.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 180,
        armor = 100
    },
    [10] = {
        name = "Директор",
        description = "Владелец ЧВК",
        salary = 2500,
        models = {"models/kleiner.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 200,
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