local _, FR = ...

local UIHelper = FR.UIHelper or {}
FR.UIHelper = UIHelper

local OptionsUI = {}
FR.OptionsUI = OptionsUI

local Utils = FR.Utils or {}
FR.Utils = Utils

function OptionsUI:InitializeOptions()

    local panel = CreateFrame("Frame")
    panel.name = "Options"

	local yPos = -16

  	-- Create header and description
	local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", 16, yPos)
	title:SetText("StopAnnoyingMe")
	title:SetTextColor(1, 0.84, 0)  -- Gold color for main title
	yPos = yPos - 25

    -- SECTION: General Settings
    local header, newY = UIHelper.CreateSectionHeader(panel, "General Settings", 16, yPos)
    yPos = newY - 5

    local onLoginText = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    onLoginText:SetPoint("TOPLEFT", 36, yPos)
    onLoginText:SetText("Display 'Addon Loaded' Message")
     -- Text Notification Checkbox
    local _, _ = UIHelper.CreateCheckbox(
        panel,
        "CheckboxBNetFriendText" ,
        "",
        250,
        yPos + 7,
        SAMDB.options.onLoginMessage,
        function(self)
            SAMDB.options.onLoginMessage = self:GetChecked()
        end
    )

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

function OptionsUI:Initialize()
	self:InitializeOptions()
end