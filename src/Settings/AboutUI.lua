local addonName, FR = ...

local AboutUI = {}
FR.AboutUI = AboutUI

local UIHelper = FR.UIHelper or {}
FR.UIHelper = UIHelper

function AboutUI:InitializeOptions()
    local panel = CreateFrame("Frame")
    panel.name = addonName

    panel.layoutIndex = 1
	panel.OnShow = function(self)
		return true
	end

    -- header and description
    local titleText = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    titleText:SetPoint("TOPLEFT", 16, -16)
    titleText:SetText(addonName)

    -- Get addon version
    local version = C_AddOns.GetAddOnMetadata(addonName, "Version") or "Unknown"
    local versionText = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    versionText:SetPoint("TOPLEFT", titleText, "BOTTOMLEFT", 0, -8)
    versionText:SetText("Version: " .. version)

    local yPos = -70

    -- Tab header and description
	local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", 16, yPos)
	title:SetText("About")
	title:SetTextColor(1, 0.84, 0)
	yPos = yPos - 25

    -- About Text
    
    local subtitle = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	subtitle:SetPoint("TOPLEFT", 16, yPos)
	subtitle:SetText("Mute annoying toy sounds and remove annoying spells that other players cast on you.")
	yPos = yPos - 25

    -- Website URL as text
    local websiteLabel = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    websiteLabel:SetPoint("TOPLEFT", 16, yPos)
    websiteLabel:SetText("Website:")

    local websiteURL = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    websiteURL:SetPoint("TOPLEFT", websiteLabel, "TOPLEFT", 70, 0)
    websiteURL:SetText("https://www.github.com/nickstuer/StopAnnoyingMe")
    websiteURL:SetTextColor(0.3, 0.6, 1.0)

    yPos = yPos - 50


    -- Additional info at bottom
    local additionalInfo = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    additionalInfo:SetPoint("BOTTOMRIGHT", -16, 16)
    additionalInfo:SetJustifyH("RIGHT")
    additionalInfo:SetText("Thank you!")

    -- Register with the Interface Options
    FR.mainCategory = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
	FR.mainCategory.ID = panel.name
	Settings.RegisterAddOnCategory(FR.mainCategory)

    -- Required callbacks
    panel.OnRefresh = function()
    end
    panel.OnCommit = function()
    end
    panel.OnDefault = function()
    end

    return panel
end

function AboutUI:Initialize()
    self:InitializeOptions()
end