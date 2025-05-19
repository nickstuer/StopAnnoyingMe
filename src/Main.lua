local addonName, FR = ...;

local Utils = FR.Utils or {}
FR.Utils = Utils

FR.version = C_AddOns.GetAddOnMetadata("StopAnnoyingMe", "Version") or "Unknown"
FR.addonName = addonName;


FR.defaults = {
	SoundsToMute = {
  		[3748753] = true, --Candleflexer's Dumbbell Toy Slam
		[1255481] = true, --Candleflexer's Dumbbell Toy Growl
	},
	SpellsToRemove = {
		[44212] = true, --Jack-o'-Lanterned!
		[44185] = true, --Jack-o'-Lanterned!
		[24732] = true, --Bat Costume
		[24735] = true, --Ghost Costume
		[24736] = true, --Ghost Costume
		[24712] = true, --Leper Gnome Costume
		[24713] = true, --Leper Gnome Costume
		[24708] = true, --Pirate Costume
		[24709] = true, --Pirate Costume
		[24723] = true, --Skeleton Costume
		[24740] = true, --Wisp Costume
		[27571] = true, --Cascade of Roses
		[61819] = true, --Manabonked!
		[61834] = true, --Manabonked!
		[69285] = true, --Mohawked!
		[24710] = true, --Ninja Costume
		[60122] = true, --Baby Spice
		[60106] = true, --Old Spice
		[26157] = true, --PX-238 Winter Wondervolt
		[44755] = true, --Snowflakes
		[61815] = true, --Sprung!
		[61781] = true, --Turkey Feathers
		[279509] = true, -- Witch
		[58493] = true, -- Mohawk Grenade
	}
}

local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

initFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
		if not StopAnnoyingMeDB then
			StopAnnoyingMeDB = CopyTable(FR.defaults)
		end

		-- Upgrade
		for k, v in pairs(FR.defaults) do
			if StopAnnoyingMeDB[k] == nil then
				StopAnnoyingMeDB[k] = CopyTable(FR.defaults[k])
			end
		end

		for k, v in pairs(FR.defaults.SpellsToRemove) do
			if StopAnnoyingMeDB.SpellsToRemove[k] == nil then
				StopAnnoyingMeDB.SpellsToRemove[k] = FR.defaults.SpellsToRemove[k]
			end
		end

		for k, v in pairs(FR.defaults.SoundsToMute) do
			if StopAnnoyingMeDB.SoundsToMute[k] == nil then
				StopAnnoyingMeDB.SoundsToMute[k] = FR.defaults.SoundsToMute[k]
			end
		end

		self:UnregisterEvent("ADDON_LOADED")
	end

	if event == "PLAYER_LOGIN" then
		self:UnregisterEvent("PLAYER_LOGIN")
	end

	if event == "PLAYER_ENTERING_WORLD" then
		Utils.Print("Addon Loaded. Version: " .. FR.version)

		-- Mute Sounds
		for k, v in pairs(StopAnnoyingMeDB.SoundsToMute) do
			if v then
				MuteSoundFile(k)
			end
		end

		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		
    end
end)

-- Slash Commands
SLASH_STOPANNOYINGME1 = "/stopannoyingme"
SlashCmdList["STOPANNOYINGME"] = function(msg)
	if msg == "reset" then
		StopAnnoyingMeDB = nil
		StopAnnoyingMeDB = CopyTable(FR.defaults)

		Utils.Print("Settings have been reset to defaults. Please reload the UI to apply changes!")
		return
	end
end



-- Remove Buffs
local InCombatLockdown, UnitBuff, CancelUnitBuff, print, select = InCombatLockdown, UnitBuff, CancelUnitBuff, print, select

local removeBuff = CreateFrame("Frame")

removeBuff:SetScript("OnEvent", function(self, event, unit)
    if ((event == "PLAYER_REGEN_ENABLED") or (unit == "player")) and (not InCombatLockdown()) then
        local i = 1
        local aura = C_UnitAuras.GetBuffDataByIndex("player", i)
        while aura do
            if StopAnnoyingMeDB.SpellsToRemove[aura.spellId] then
                CancelUnitBuff("player", i)

				local auraInfo = C_UnitAuras.GetPlayerAuraBySpellID(aura.spellId)
                Utils.Debug("|cFFFFFF00[RemoveBuff]|r " .. auraInfo.name .. " removed.")
                break
            end
            i = i + 1
            aura = C_UnitAuras.GetBuffDataByIndex("player", i)
        end
    end
end)

removeBuff:RegisterEvent("UNIT_AURA")
removeBuff:RegisterEvent("PLAYER_REGEN_ENABLED")