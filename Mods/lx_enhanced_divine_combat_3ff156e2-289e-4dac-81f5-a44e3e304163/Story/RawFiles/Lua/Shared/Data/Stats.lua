Data.Stats = {}

Data.Stats.CustomAttributeBonuses = {
    Finesse = {Potion = {Movement = Ext.ExtraData.DGM_FinesseMovementBonus}, Status = {StackId = "DGM_Finesse"}, Cap = Ext.ExtraData.DGM_FinesseMovementCap},
    Intelligence = {Potion = {AccuracyBoost = Ext.ExtraData.DGM_IntelligenceAccuracyBonus}, Status = {StackId = "DGM_Intelligence"}, Cap = Ext.ExtraData.DGM_IntelligenceAccuracyCap}
}

Data.Stats.CustomAbilityBonuses = {
    SingleHanded = { Potion = {
            ArmorBoost=Ext.ExtraData.DGM_SingleHandedArmorBonus,
            MagicArmorBoost=Ext.ExtraData.DGM_SingleHandedArmorBonus,
            FireResistance=Ext.ExtraData.DGM_SingleHandedResistanceBonus,
            EarthResistance=Ext.ExtraData.DGM_SingleHandedResistanceBonus,
            PoisonResistance=Ext.ExtraData.DGM_SingleHandedResistanceBonus,
            WaterResistance=Ext.ExtraData.DGM_SingleHandedResistanceBonus,
            AirResistance=Ext.ExtraData.DGM_SingleHandedResistanceBonus
        }, Status = {StackId = "DGM_SingleHanded"}
    },
    -- TwoHanded = {},
    Ranged = {Potion = {RangeBoost=Ext.ExtraData.DGM_RangedRangeBonus}, Status = {StackId = "DGM_Ranged"}, Cap = 10},
    -- DualWielding = {},
    -- None = {}
}

Data.Stats.CrossbowMovementPenalty = {
    Base = Ext.ExtraData.DGM_CrossbowBasePenalty,
    Level = Ext.ExtraData.DGM_CrossbowLevelGrowthPenalty
}

---@type Enum
Data.TalentEnum = {
	ItemMovement = 1,
	ItemCreation = 2,
	Flanking = 3,
	AttackOfOpportunity = 4,
	Backstab = 5,
	Trade = 6,
	Lockpick = 7,
	ChanceToHitRanged = 8,
	ChanceToHitMelee = 9,
	Damage = 10,
	ActionPoints = 11,
	ActionPoints2 = 12,
	Criticals = 13,
	IncreasedArmor = 14,
	Sight = 15,
	ResistFear = 16,
	ResistKnockdown = 17,
	ResistStun = 18,
	ResistPoison = 19,
	ResistSilence = 20,
	ResistDead = 21,
	Carry = 22,
	Throwing = 23,
	Repair = 24,
	ExpGain = 25,
	ExtraStatPoints = 26,
	ExtraSkillPoints = 27,
	Durability = 28,
	Awareness = 29,
	Vitality = 30,
	FireSpells = 31,
	WaterSpells = 32,
	AirSpells = 33,
	EarthSpells = 34,
	Charm = 35,
	Intimidate = 36,
	Reason = 37,
	Luck = 38,
	Initiative = 39,
	InventoryAccess = 40,
	AvoidDetection = 41,
	AnimalEmpathy = 42,
	Escapist = 43,
	StandYourGround = 44,
	SurpriseAttack = 45,
	LightStep = 46,
	ResurrectToFullHealth = 47,
	Scientist = 48,
	Raistlin = 49,
	MrKnowItAll = 50,
	WhatARush = 51,
	FaroutDude = 52,
	Leech = 53,
	ElementalAffinity = 54,
	FiveStarRestaurant = 55,
	Bully = 56,
	ElementalRanger = 57,
	LightningRod = 58,
	Politician = 59,
	WeatherProof = 60,
	LoneWolf = 61,
	Zombie = 62,
	Demon = 63,
	IceKing = 64,
	Courageous = 65,
	GoldenMage = 66,
	WalkItOff = 67,
	FolkDancer = 68,
	SpillNoBlood = 69,
	Stench = 70,
	Kickstarter = 71,
	WarriorLoreNaturalArmor = 72,
	WarriorLoreNaturalHealth = 73,
	WarriorLoreNaturalResistance = 74,
	RangerLoreArrowRecover = 75,
	RangerLoreEvasionBonus = 76,
	RangerLoreRangedAPBonus = 77,
	RogueLoreDaggerAPBonus = 78,
	RogueLoreDaggerBackStab = 79,
	RogueLoreMovementBonus = 80,
	RogueLoreHoldResistance = 81,
	NoAttackOfOpportunity = 82,
	WarriorLoreGrenadeRange = 83,
	RogueLoreGrenadePrecision = 84,
	WandCharge = 85,
	DualWieldingDodging = 86,
	Human_Inventive = 87,
	Human_Civil = 88,
	Elf_Lore = 89,
	Elf_CorpseEating = 90,
	Dwarf_Sturdy = 91,
	Dwarf_Sneaking = 92,
	Lizard_Resistance = 93,
	Lizard_Persuasion = 94,
	Perfectionist = 95,
	Executioner = 96,
	ViolentMagic = 97,
	QuickStep = 98,
	Quest_SpidersKiss_Str = 99,
	Quest_SpidersKiss_Int = 100,
	Quest_SpidersKiss_Per = 101,
	Quest_SpidersKiss_Null = 102,
	Memory = 103,
	Quest_TradeSecrets = 104,
	Quest_GhostTree = 105,
	BeastMaster = 106,
	LivingArmor = 107,
	Torturer = 108,
	Ambidextrous = 109,
	Unstable = 110,
	ResurrectExtraHealth = 111,
	NaturalConductor = 112,
	Quest_Rooted = 113,
	PainDrinker = 114,
	DeathfogResistant = 115,
	Sourcerer = 116,
	Rager = 117,
	Elementalist = 118,
	Sadist = 119,
	Haymaker = 120,
	Gladiator = 121,
	Indomitable = 122,
	WildMag = 123,
	Jitterbug = 124,
	Soulcatcher = 125,
	MasterThief = 126,
	GreedyVessel = 127,
	MagicCycles = 128,
}