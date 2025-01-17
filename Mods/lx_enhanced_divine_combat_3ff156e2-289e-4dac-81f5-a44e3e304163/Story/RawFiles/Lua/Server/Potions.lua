---- Potions ----
---@param character EsvCharacter
---@param potion string
function CharacterUsePoisonedPotion(character, potion)
	-- Because fuck this, this is going to be hardcoded.
	local potionTemplate = GetTemplate(potion)
	local potionDmg = 0
	if potionTemplate == "CON_Potion_Poison_A_8122de3c-a331-44a4-b51a-6767a778776f" then potionDmg = NRD_StatGetInt("POTION_Minor_Healing_Potion", "VitalityPercentage")*0.01
	elseif potionTemplate == "CON_Potion_Poison_Medium_A_3b5c5a91-00ab-4a86-bc30-b59e14951163" then potionDmg = NRD_StatGetInt("POTION_Medium_Healing_Potion", "VitalityPercentage")*0.01
	elseif potionTemplate == "CON_Potion_Poison_Large_A_6d9420d8-cbf6-444f-ac42-c535a7df99f7" then potionDmg = NRD_StatGetInt("POTION_Large_Healing_Potion", "VitalityPercentage")*0.01
	elseif potionTemplate == "CON_Potion_Poison_Giant_A_f7d43db4-96b4-4db1-b83c-b21987b63a65" then potionDmg = NRD_StatGetInt("POTION_Giant_Healing_Potion", "VitalityPercentage")*0.01
	elseif potionTemplate == "CON_Potion_Poison_Huge_A_5b31c4c8-88cd-4d86-9c23-f762126ee7f0" then potionDmg = NRD_StatGetInt("POTION_Huge_Healing_Potion", "VitalityPercentage")*0.01
	elseif potionTemplate == "CON_Potion_Poison_Elixir_6a49fb10-6f0b-4caf-9caf-9e74901dbc72" then potionDmg = NRD_StatGetInt("POTION_Healing_Elixir", "VitalityPercentage")*0.01
	else return
	end
	SetStoryEvent(character, "LX_Get_Max_HP")
	local charMaxHP = GetVarFloat(character, "LX_Max_HP")
	local fsd = 1
	if Ext.GetCharacter(character).Stats.TALENT_FiveStarRestaurant then
		fsd = 2
	end
	potionDmg = charMaxHP * potionDmg * fsd
	charRes = NRD_CharacterGetComputedStat(character, "PoisonResistance", 0)/100
	potionDmg = potionDmg * (1-charRes)
	hitHandle = NRD_HitPrepare(character, character)
	NRD_HitAddDamage(hitHandle, "Poison", potionDmg)
	NRD_HitSetInt(hitHandle, "DamagedVitality", 1)
	NRD_HitSetString(hitHandle, "DeathType", "Acid")
	NRD_HitSetInt(hitHandle, "Surface", 1)
	--NRD_HitSetInt(hitHandle, "HitType", 4)
	NRD_HitSetInt(hitHandle, "Hit", 1)
	NRD_HitQryExecute(hitHandle)
end

---@param character EsvCharacter
---@param potion string
function ManagePotionFatigue(character, potion)
	local item = Ext.ServerEntity.GetItem(potion)
	if NRD_StatGetType(item.StatsId) ~= "Potion" then return end
	local isConsumable = NRD_StatGetInt(item.StatsId, "IsConsumable")
	local isFood = NRD_StatGetInt(item.StatsId, "IsFood")
	
	-- A potion is hopefully consumable, but not food
	if isConsumable == 1 and isFood == 0 then
		local fatigue = GetVarInteger(character, "DGM_PotionFatigue")
		if fatigue == nil then fatigue = 0 end
		if fatigue == Ext.ExtraData.DGM_PotionFatigue-1 then ApplyStatus(character, "LX_POTIONWARNING", 3.0, 1) end
		if fatigue == Ext.ExtraData.DGM_PotionFatigue then ApplyStatus(character, "LX_POTIONFATIGUE1", 3.0, 1) end
		if fatigue > Ext.ExtraData.DGM_PotionFatigue then ApplyStatus(character, "LX_POTIONFATIGUE2", 3.0, 1) end
		fatigue = fatigue + 1
		SetVarInteger(character, "DGM_PotionFatigue", fatigue)
	end
end

Ext.Osiris.RegisterListener("CharacterUsedItem", 2, "before", function(character, item)
	if CharacterIsInCombat(character) == 1 then
		ManagePotionFatigue(character, item)
	end
end)

Ext.Osiris.RegisterListener("ObjectTurnStarted", 1, "before", function(object)
	if ObjectIsCharacter(object) == 1 then
		if Ext.ServerEntity.GetCharacter(object).Stats.TALENT_FiveStarRestaurant then
			SetVarInteger(object, "DGM_PotionFatigue", -1)
		else
			SetVarInteger(object, "DGM_PotionFatigue", 0)
		end
	end
end)


Ext.Osiris.RegisterListener("NRD_OnStatusAttempt", 4, "before", function(target, statusId, handle, instigator)
	if statusId == "CONSUME" then
		local status = Ext.GetStatus(target, handle)
		if status.StatsIds then
			local potion = Ext.Stats.Get(status.StatsIds[1].StatsId)
			if potion.VP_VitalityMinimum ~= 0 and potion.IsConsumable == "Yes" and potion.IsFood ~= "Yes" then
				local character = Ext.ServerEntity.GetCharacter(target)
				character.UserVars.VP_PotionVitalityMinimum = Game.Math.GetAverageLevelDamage(character.Stats.Level)*potion.VP_VitalityMinimum/100
			end
		end
	elseif statusId == "HEAL" then
		local object = Ext.ServerEntity.GetGameObject(target)
		if Helpers.IsCharacter(object) and object.UserVars.VP_PotionVitalityMinimum and object.UserVars.VP_PotionVitalityMinimum > 0 then
			local status = Ext.ServerEntity.GetStatus(target, handle) ---@type EsvStatusHeal
			local amount = status.HealAmount
			if object.Stats.TALENT_FiveStarRestaurant then
				amount = amount/2
			end
			if amount < object.UserVars.VP_PotionVitalityMinimum then
				status.HealAmount = Ext.Utils.Round(object.UserVars.VP_PotionVitalityMinimum) * (object.Stats.TALENT_FiveStarRestaurant and 2 or 1)
			end
			object.UserVars.VP_PotionVitalityMinimum = 0
		end
	end
end)