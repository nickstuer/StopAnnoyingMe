local addonName, FR = ...;

local Utils = FR.Utils or {}
FR.Utils = Utils

FR.version = C_AddOns.GetAddOnMetadata("StopAnnoyingMe", "Version") or "Unknown"
FR.addonName = addonName;

FR.defaults = {
	SoundsToMute = {
		[1] = {
			name = "Candleflexer's Dumbbell Toy",
			spellID = 228698,
			soundIDs = "3748753,1255481",
			enabled = true,
		}
	},
	SpellsToRemove = {
		[1] = {
			name = "Jack-o'-Lanterned!",
			spellID = 44212,
			enabled = false,
		},
		[2] = {
			name = "Jack-o'-Lanterned!",
			spellID = 44185,
			enabled = false,
		},
		[3] = {
			name = "Bat Costume",
			spellID = 24732,
			enabled = true,
		},
		[4] = {
			name = "Ghost Costume",
			spellID = 24735,
			enabled = true,
		},
		[5] = {
			name = "Ghost Costume",
			spellID = 24736,
			enabled = true,
		},
		[6] = {
			name = "Leper Gnome Costume",
			spellID = 24712,
			enabled = true,
		},
		[7] = {
			name = "Leper Gnome Costume",
			spellID = 24713,
			enabled = true,
		},
		[8] = {
			name = "Pirate Costume",
			spellID = 24708,
			enabled = true,
		},
		[9] = {
			name = "Pirate Costume",
			spellID = 24709,
			enabled = true,
		},
		[10] = {
			name = "Skeleton Costume",
			spellID = 24723,
			enabled = true,
		},
		[11] = {
			name = "Wisp Costume",
			spellID = 24740,
			enabled = true,
		},
		[12] = {
			name = "Cascade of Roses",
			spellID = 27571,
			enabled = true,
		},
		[13] = {
			name = "Manabonked!",
			spellID = 61819,
			enabled = true,
		},
		[14] = {
			name = "Manabonked!",
			spellID = 61834,
			enabled = true,
		},
		[15] = {
			name = "Mohawked!",
			spellID = 69285,
			enabled = true,
		},
		[16] = {
			name = "Ninja Costume",
			spellID = 24710,
			enabled = true,
		},
		[17] = {
			name= "Baby Spice",
			spellID= 60122,
			enabled= true,
		},
		[18] = {
			name= "Old Spice",
			spellID = 60106,
			enabled = true,
		},
		[19] = {
			name= "PX-238 Winter Wondervolt",
			spellID = 26157,
			enabled = true,
		},
		[20] = {
			name= "Snowflakes",
			spellID= 44755,
			enabled= true,
		},
		[21] = {
			name= "Sprung!",
			spellID = 61815,
			enabled = true,
		},
		[22] = {
			name= "Turkey Feathers",
			spellID= 61781,
			enabled= true
		},
		[23] = {
			name= "Witch",
			spellID = 279509,
			enabled = true,
		},
		[24] = {
			name= "Mohawk Grenade",
			spellID = 58493,
			enabled = true,
		},
		[25] = {
			name= "Detoxified Blight",
			spellID = 290224,
			enabled = true,
		},
		[26] = {
			name= "Sculpting Leather Finery",
			spellID = 394001,
			enabled = true,
		},
		[27] = {
			name= "Spark of Madness",
			spellID = 394003,
			enabled = true,
		},
		[28] = {
			name= "A Cultivator's Colors",
			spellID = 394005,
			enabled = true,
		},
		[29] = {
			name= "Rockin' Mining Gear",
			spellID = 394006,
			enabled = true,
		},
		[30] = {
			name= "A Production-Grade Display",
			spellID = 394007,
			enabled = true,
		},
		[31] = {
			name= "A Looker's Charm",
			spellID = 394008,
			enabled = true,
		},
		[32] = {
			name= "Dressed To Kill",
			spellID = 394011,
			enabled = true,
		},
		[33] = {
			name= "Bioluminescent",
			spellID = 291118,
			enabled = true,
		},
		[34] = {
			name = "Haunted",
			spellID = 170950,
			enabled = true,
		},
		[35] = {
			name = "You're Next",
			spellID = 390925,
			enabled = true,
		},
		[36] = {
			name = "Holy Retribution",
			spellID = 254523,
			enabled = true,
		},
		[37] = {
			name = "Doomed Day",
			spellID = 398585,
			enabled = true,
		},
		[38] = {
			name = "Ken-Ken Mask",
			spellID = 128328,
			enabled = true,
		},
		[39] = {
			name = "Painted Orange",
			spellID = 294248,
			enabled = true,
		},
		[40] = {
			name = "Painted Green",
			spellID = 294250,
			enabled = true,
		},
		[41] = {
			name = "Painted Blue",
			spellID = 294249,
			enabled = true,
		},
		[42] = {
			name = "Turnip Paint Gun",
			spellID = 127803,
			enabled = true,
		},
		[43] = {
			name = "Ethereal Empowerment",
			spellID = 1237208,
			enabled = true,
		},
		[44] = {
			name = "Ethereal Empowerment2",
			spellID = 1237202,
			enabled = true,
		},
		[45] = {
			name = "Swarmed",
			spellID = 318452,
			enabled = true,
		},
		[46] = {
			name = "Spiders!",
			spellID = 225017,
			enabled = true,
		},
		[47] = {
			name = "Moonkin Feather",
			spellID = 195802,
			enabled = true,
		},
		[48] = {
			name = "Moonkin Molting",
			spellID = 195805,
			enabled = true,
		},
		[49] = {
			name = "Feeling Moonkin",
			spellID = 195810,
			enabled = true,
		},
		[50] = {
			name = "Owlvercome wth the Fever",
			spellID = 195816,
			enabled = true,
		},
		[51] = {
			name = "Moonfeather Fever",
			spellID = 195776,
			enabled = true,
		}
	},
	miscSettings = {
		legionRemixQueuePopSound = true,
	},
	options = {
		onLoginMessage = true,
		manuallyBlockedSoundIDs = "",
		manuallyBlockedSpellIDs = "",
	},
	config = {
		databaseVersion = 1,
	}
}

local buffsToRemove = {}

local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

initFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
		if not SAMDB then
			SAMDB = CopyTable(FR.defaults)
		end

		-- Upgrade
		for k, v in pairs(FR.defaults) do
			if SAMDB[k] == nil then
				SAMDB[k] = CopyTable(FR.defaults[k])
			end
		end

		for k, v in pairs(FR.defaults.SpellsToRemove) do
			if SAMDB.SpellsToRemove[k] == nil then
				SAMDB.SpellsToRemove[k] = FR.defaults.SpellsToRemove[k]
			end
		end

		for k, v in pairs(FR.defaults.SoundsToMute) do
			if SAMDB.SoundsToMute[k] == nil then
				SAMDB.SoundsToMute[k] = FR.defaults.SoundsToMute[k]
			end
		end

		for k, v in pairs(FR.defaults.miscSettings) do
			if SAMDB.miscSettings[k] == nil then
				SAMDB.miscSettings[k] = FR.defaults.miscSettings[k]
			end
		end

		for k, v in pairs(FR.defaults.options) do
			if SAMDB.options[k] == nil then
				SAMDB.options[k] = FR.defaults.options[k]
			end
		end

		for k, v in pairs(FR.defaults.config) do
			if SAMDB.config[k] == nil then
				SAMDB.config[k] = FR.defaults.config[k]
			end
		end
		

		C_Timer.After(0.2, function()
            if FR.AboutUI and FR.AboutUI.Initialize then
                FR.AboutUI:Initialize()
            end

            C_Timer.After(0.2, function()
                if FR.SoundsUI and FR.SoundsUI.Initialize then
                    FR.SoundsUI:Initialize()
                end

				C_Timer.After(0.2, function()
					if FR.SpellsUI and FR.SpellsUI.Initialize then
						FR.SpellsUI:Initialize()
					end

					C_Timer.After(0.1, function()
					if FR.OptionsUI and FR.OptionsUI.Initialize then
						FR.OptionsUI:Initialize()
					end

						C_Timer.After(0.1, function()
							if FR.SupportUI and FR.SupportUI.Initialize then
								FR.SupportUI:Initialize()
							end

							C_Timer.After(0.1, function()
								if FR.MiscUI and FR.MiscUI.Initialize then
									FR.MiscUI:Initialize()
								end
							end)
						end)
					end)
				end)
            end)
        end)

		self:UnregisterEvent("ADDON_LOADED")
	end

	if event == "PLAYER_LOGIN" then
		self:UnregisterEvent("PLAYER_LOGIN")
	end

	if event == "PLAYER_ENTERING_WORLD" then
		if SAMDB.options.onLoginMessage then
			Utils.Print("Addon Loaded. Version: " .. FR.version)
		end
		
		-- Mute Sounds
		for k, v in pairs(SAMDB.SoundsToMute) do
			if v.enabled then
				local soundIDs = Utils.SplitByCommas(v.soundIDs)
				for _, soundID in ipairs(soundIDs) do
					MuteSoundFile(soundID)
				end

			end
		end

		-- Check spells to remove and save enabled buffs to local table
		for k, v in pairs(SAMDB.SpellsToRemove) do
			if v.enabled then
				buffsToRemove[v.spellID] = true
			end
		end

		-- Check for legion remix queue pop sound setting
		if SAMDB.miscSettings.legionRemixQueuePopSound then
			MuteSoundFile(567478)
		end

		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
end)

-- Slash Commands
SLASH_STOPANNOYINGME1 = "/stopannoyingme"
SLASH_STOPANNOYINGME2 = "/sam"
SlashCmdList["STOPANNOYINGME"] = function(msg)
	if msg == "reset" then
		SAMDB = nil
		SAMDB = CopyTable(FR.defaults)

		Utils.Print("Settings have been reset to defaults. Please reload the UI to apply changes!")
		return
	end

	Settings.OpenToCategory(addonName)
end

local function checkLFGStillActive()
    if GetLFGProposal() then
        print("|cff00ff00[QueueAlert]|r Your dungeon or raid queue is still up!")
		PlaySoundFile(218932)
    else
        print("|cffff0000[QueueAlert]|r LFG queue expired or was declined.")
    end
end

-- Misc Settings
local f = CreateFrame("Frame")
f:RegisterEvent("LFG_PROPOSAL_SHOW")
f:SetScript("OnEvent", function(self, event, ...)
    if event == "LFG_PROPOSAL_SHOW" and SAMDB.miscSettings.legionRemixQueuePopSound then
        print("|cff00ff00[QueueAlert]|r Your dungeon or raid queue popped!")
		C_Timer.After(3, checkLFGStillActive)
        --PlaySound(8959) -- Optional sound effect
    end
end)

-- Remove Buffs
local InCombatLockdown, UnitBuff, CancelUnitBuff, print, select = InCombatLockdown, UnitBuff, CancelUnitBuff, print, select

local removeBuff = CreateFrame("Frame")

removeBuff:SetScript("OnEvent", function(self, event, unit)
    if ((event == "PLAYER_REGEN_ENABLED") or (unit == "player")) and (not InCombatLockdown()) then
        local i = 1
        local aura = C_UnitAuras.GetBuffDataByIndex("player", i)
        while aura do
            if buffsToRemove[aura.spellId] then
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

-- Hearthstone Table Detection
local hearthstoneTable = CreateFrame("Frame")

hearthstoneTable:SetScript("OnEvent", function(self, event, unit, castGUID, spellID)
    -- Debug: print all spell casts to find the right ID
    -- if spellID then
    --    local spellInfo = C_Spell.GetSpellInfo(spellID)
    --    local spellName = spellInfo and spellInfo.name or "unknown"
    --    Utils.Print("UNIT_SPELLCAST_SUCCEEDED: " .. (UnitName(unit) or "unknown") .. " cast " .. spellName .. " (ID: " .. spellID .. ")")
    -- end
    
    if event == "UNIT_SPELLCAST_SUCCEEDED" and not InCombatLockdown() then
        if spellID == 430884 then
            local unitName = UnitName(unit)
            if unitName then
                SendChatMessage("uses StopAnnoyingMe and saw " .. unitName .. " summoned a Hearthstone Table!", "EMOTE")
            end
        end
    end
end)

hearthstoneTable:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")