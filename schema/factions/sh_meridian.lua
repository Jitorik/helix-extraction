FACTION.uniqueID = "meridian"
FACTION.name = "Консорциум МЕРИДИАН"
FACTION.desc = "Добывающая корпорация, контролирующая месторождение Неодима-Х."
FACTION.color = Color(200, 150, 50)
FACTION.default = true

FACTION.models = {
    "models/eli.mdl",
    "models/mossman.mdl"
}

FACTION.ranks = {
    [1] = {
        name = "Стажёр",
        description = "Новичок",
        salary = 60,
        models = {"models/eli.mdl"},
        weapons = {},
        maxHealth = 80,
        armor = 0
    },
    [2] = {
        name = "Рабочий",
        description = "Добыча, логистика",
        salary = 100,
        models = {"models/eli.mdl"},
        weapons = {},
        maxHealth = 90,
        armor = 10
    },
    [3] = {
        name = "Старший рабочий",
        description = "Бригадир",
        salary = 150,
        models = {"models/eli.mdl"},
        weapons = {},
        maxHealth = 100,
        armor = 15
    },
    [4] = {
        name = "Охранник",
        description = "Безопасность объекта",
        salary = 180,
        models = {"models/eli.mdl"},
        weapons = {"weapon_pistol"},
        maxHealth = 100,
        armor = 30
    },
    [5] = {
        name = "Старший охранник",
        description = "Командир смены",
        salary = 250,
        models = {"models/eli.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1"},
        maxHealth = 110,
        armor = 40
    },
    [6] = {
        name = "Супервайзер",
        description = "Надзор за рабочими",
        salary = 350,
        models = {"models/mossman.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1"},
        maxHealth = 120,
        armor = 50
    },
    [7] = {
        name = "Старший менеджер",
        description = "Заместитель менеджера",
        salary = 500,
        models = {"models/mossman.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1"},
        maxHealth = 130,
        armor = 60
    },
    [8] = {
        name = "Менеджер объекта",
        description = "Управление объектом",
        salary = 750,
        models = {"models/mossman.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1"},
        maxHealth = 140,
        armor = 70
    },
    [9] = {
        name = "Директор по добыче",
        description = "Руководитель производства",
        salary = 1100,
        models = {"models/mossman.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1"},
        maxHealth = 150,
        armor = 80
    },
    [10] = {
        name = "Директор по безопасности",
        description = "Руководитель охраны",
        salary = 1400,
        models = {"models/mossman.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 160,
        armor = 90
    },
    [11] = {
        name = "Заместитель CEO",
        description = "Второе лицо",
        salary = 2000,
        models = {"models/mossman.mdl"},
        weapons = {"weapon_pistol", "weapon_smg1", "weapon_ar2"},
        maxHealth = 180,
        armor = 100
    },
    [12] = {
        name = "CEO",
        description = "Генеральный директор",
        salary = 3000,
        models = {"models/mossman.mdl"},
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