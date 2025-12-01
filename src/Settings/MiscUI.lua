local addonName, FR = ...

local MiscUI = {}
FR.MiscUI = MiscUI

local Utils = FR.Utils or {}
FR.Utils = Utils

local UIHelper = FR.UIHelper or {}
FR.UIHelper = UIHelper

function MiscUI:InitializeOptions()

    local panel = CreateFrame("Frame")
    panel.name = "Miscellaneous"

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
	subtitle:SetText("Make sure to reload the UI after making changes.")
	yPos = yPos - 25

	-- Add separator
	local _, newY = UIHelper.CreateSeparator(scrollChild, 16, yPos)
	yPos = newY

    -- SECTION: Mute Sounds
   local headerBNetFavorite1 = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	headerBNetFavorite1:SetPoint("TOPLEFT", 16, yPos)
	headerBNetFavorite1:SetText("Hearthstone Table Detector")
	yPos = yPos - 25

    local option = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        option:SetPoint("TOPLEFT", 16, yPos)
        option:SetText("Print chat message")


    -- Checkbox
    local _, newY = UIHelper.CreateCheckbox(
        scrollChild,
        "CheckboxPrintHearthstoneTableMessage",
        "",
        300,
        yPos + 7,
        SAMDB.miscSettings.printHearthstoneTableMessage,
        function(self)
            SAMDB.miscSettings.printHearthstoneTableMessage = self:GetChecked()
        end
    )

    yPos = newY - 8

    local option2 = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        option2:SetPoint("TOPLEFT", 16, yPos)
        option2:SetText("Announce /emote")


    -- Checkbox
    local _, newY = UIHelper.CreateCheckbox(
        scrollChild,
        "CheckboxEmoteHearthstoneTableMessage",
        "",
        300,
        yPos + 7,
        SAMDB.miscSettings.emoteHearthstoneTableMessage,
        function(self)
            SAMDB.miscSettings.emoteHearthstoneTableMessage = self:GetChecked()
        end
    )

    yPos = newY - 8

    yPos = yPos - 55
	local _, newY = UIHelper.CreateSeparator(scrollChild, 16, yPos)
	yPos = newY - 50


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

function MiscUI:Initialize()
	self:InitializeOptions()
end