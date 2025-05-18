local addonName, FR = ...;

local Utils = FR.Utils or {}
FR.Utils = Utils

FR.version = C_AddOns.GetAddOnMetadata("StopAnnoyingMe", "Version") or "Unknown"
FR.addonName = addonName;

local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

initFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
		if not StopAnnoyingMeDB then
			StopAnnoyingMeDB = {
				--settings = CopyTable(FR.defaults),
				settings = {}
			}
		end

		self:UnregisterEvent("ADDON_LOADED")
	end

	if event == "PLAYER_LOGIN" then
		--C_Timer.After(5, FR.Scan); -- Start scanning after a short delay
		self:UnregisterEvent("PLAYER_LOGIN")
	end

	if event == "PLAYER_ENTERING_WORLD" then
		Utils.Print("Addon Loaded. Version: " .. FR.version)

        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
end)

-- Slash Commands
SLASH_STOPANNOYINGME1 = "/stopannyingme"
SlashCmdList["STOPANNOYINGME"] = function(msg)
	if msg == "reset" then
		StopAnnoyingMeDB = nil
		StopAnnoyingMeDB = {
			settings = CopyTable(FR.defaults),
		}
		Utils.Print("Settings have been reset to defaults. Please reload the UI to apply changes!")
		return
	end
end
