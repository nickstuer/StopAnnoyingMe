local addonName, FR = ...

local SoundsUI = {}
FR.SoundsUI = SoundsUI

local Utils = FR.Utils or {}
FR.Utils = Utils

local UIHelper = FR.UIHelper or {}
FR.UIHelper = UIHelper

function SoundsUI:InitializeOptions()

    local panel = CreateFrame("Frame")
    panel.name = "Sounds"

    -- Scrollbar
    local scrollFrame = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 3, -4)
    scrollFrame:SetPoint("BOTTOMRIGHT", -27, 4)
    local scrollChild = CreateFrame("Frame")
    scrollFrame:SetScrollChild(scrollChild)
    scrollChild:SetWidth(600)
    scrollChild:SetHeight(1)


	local yPos = -16

  	-- Create header and description
	local title = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", 16, yPos)
	title:SetText(addonName)
	title:SetTextColor(1, 0.84, 0)  -- Gold color for main title
	yPos = yPos - 25

	local subtitle = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	subtitle:SetPoint("TOPLEFT", 16, yPos)
	subtitle:SetText("Select which sounds to mute. Make sure to reload the UI after making changes.")
	yPos = yPos - 25

	-- Add separator
	local _, newY = UIHelper.CreateSeparator(scrollChild, 16, yPos)
	yPos = newY

    -- SECTION: Mute Sounds
   local headerBNetFavorite1 = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	headerBNetFavorite1:SetPoint("TOPLEFT", 16, yPos)
	headerBNetFavorite1:SetText("Sound")

    local headerBNetFavorite2 = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	headerBNetFavorite2:SetPoint("TOPLEFT", 300, yPos)
	headerBNetFavorite2:SetText("Mute")
    yPos = yPos - 25


    for k, v in pairs(SAMDB.SoundsToMute) do
        local icon = "interface/icons/inv_misc_questionmark.blp"

        local spell = C_Spell.GetSpellInfo(SAMDB.SoundsToMute[k]["spellID"])
      
        --C_ToyBox.GetToyInfo(SAMDB.SoundsToMute[k]["spellID"])

        local option = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        option:SetPoint("TOPLEFT", 16, yPos)
        option:SetText("|T" .. icon .. ":20:20:0:0|t " .. SAMDB.SoundsToMute[k]["name"])


        -- Checkbox
        local _, newY = UIHelper.CreateCheckbox(
            scrollChild,
            "Checkbox" .. k,
            "",
            300,
            yPos + 7,
            SAMDB.SoundsToMute[k]["enabled"],
            function(self)
                SAMDB.SoundsToMute[k]["enabled"] = self:GetChecked()
            end
        )

        yPos = newY - 8
    end

    yPos = yPos - 55
	local _, newY = UIHelper.CreateSeparator(scrollChild, 16, yPos)
	yPos = newY - 50

    -- SECTION: Reset Settings
    local button = CreateFrame("Button", "MyAddonButton", scrollChild, "GameMenuButtonTemplate")
    button:SetPoint("TOPLEFT", 150, yPos)
    button:SetSize(200, 30)
    button:SetText("Reset All Settings to Defaults")

    button:SetScript("OnClick", function()
        Utils.Print("Settings have been reset to defaults. Please reload the UI to apply changes!")
        SAMDB = CopyTable(FR.defaults)
    end)

    -- Register with the Interface Options
    local supportCategory = Settings.RegisterCanvasLayoutSubcategory(FR.mainCategory, panel, panel.name)
    FR.supportCategory = supportCategory
    FR.supportCategory.ID = panel.name

	panel.OnRefresh = function()
	end
	panel.OnCommit = function()
	end
	panel.OnDefault = function()
	end

	return panel
end

function SoundsUI:Initialize()
	self:InitializeOptions()
end