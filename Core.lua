local function HideStars()
	print('Left the Maw')
end

local function UpdateStars(widgetValue)
	local stars = math.floor(widgetValue / 1000)

	if not TEMP_STARS then
		TEMP_STARS = stars
		print(string.format('%s GTA Maw Stars',stars))
	end
	if TEMP_STARS then
		if TEMP_STARS~= stars then
			print(string.format('%s GTA Maw Stars',stars))
		end
	end
end

local function Stars(self, event, widget)
	local widgetData = C_UIWidgetManager.GetStatusBarWidgetVisualizationInfo(2359)
	if widgetData then
		if widgetData.barValue then
			UpdateStars(widgetData.barValue)
		end
	else
		HideStars()
	end
end


local widgetUpdate = CreateFrame('frame')
widgetUpdate:RegisterEvent('UPDATE_UI_WIDGET')
widgetUpdate:SetScript('OnEvent', Stars)