-- _                       __          ___                       
-- | |                      \ \        / / |                      
-- | | _____  __ _ _ __  _   \ \  /\  / /| |__   ___  ___ _______ 
-- | |/ / _ \/ _` | '_ \| | | \ \/  \/ / | '_ \ / _ \/ _ \_  / _ \
-- |   <  __/ (_| | | | | |_| |\  /\  /  | | | |  __/  __// /  __/
-- |_|\_\___|\__,_|_| |_|\__,_| \/  \/   |_| |_|\___|\___/___\___|
-------------------------------------------------------------------------------------------------------------------------------
-- This mod was created by keanuWheeze from CP2077 Modding Tools Discord. 
--
-- You are free to use this mod as long as you follow the following license guidelines:
--    * It may not be uploaded to any other site without my express permission.
--    * Using any code contained herein in another mod requires full credits / asking me.
--    * You may not fork this code and make your own competing version of this mod available for download without my permission.
--    
------------------------------------------------------------------------------------------------------------------------------- 

zoom = {
	isUIVisible = false,
	ui = require("modules/ui"),
	fileSys = require("modules/fileSys"),
    input = require("modules/input"),
    GameSettings = require("modules/GameSettings"),

    defaultSettings = {modEnabled = true,
                       Wea_SniperRifle = {enabled = true, levels = 3, amount = 3, scopeNeeded = false},
                       Wea_PrecisionRifle = {enabled = true, levels = 3, amount = 3, scopeNeeded = true},
                       Wea_LightMachineGun = {enabled = false, levels = 2, amount = 2, scopeNeeded = true},
                       Wea_Rifle = {enabled = false, levels = 2, amount = 2, scopeNeeded = true}},
    currentZoom = 0,
    weaDefaultZoom = 0,
    zoomLevel = 0,
    totalZoomLevels = 0,
    zoomIncrement = 0,
    zoomAllowed = false
}

function zoom:new()

registerForEvent("onInit", function()
	zoom.fileSys.tryCreateConfig("config/config.json", zoom.defaultSettings)
	zoom.config = zoom.fileSys.loadFile("config/config.json") 
    zoom.input.startInputObserver(zoom)
    zoom.GameSettings.Set("/gameplay/difficulty/SwayEffect", 1)
    zoom.GameSettings.Save()
end)

registerForEvent("onDraw", function()
	if zoom.isUIVisible then	
		zoom.ui.draw(zoom)
	end
end)

registerForEvent("onOverlayOpen", function()
    zoom.isUIVisible = true
end)

registerForEvent("onOverlayClose", function()
    zoom.isUIVisible = false
end)

registerHotkey('zoom', 'Change Zoom Level', function()
    if zoom.GameSettings.Get("/gameplay/difficulty/SwayEffect") ~= 1 then
        zoom.GameSettings.Set("/gameplay/difficulty/SwayEffect", 1)
        zoom.GameSettings.Save()
    end
    if zoom.zoomLevel < zoom.totalZoomLevels then
        zoom.zoomLevel = zoom.zoomLevel + 1
        zoom.currentZoom = zoom.currentZoom + zoom.zoomIncrement
    else
        zoom.zoomLevel = 0
        zoom.currentZoom = zoom.weaDefaultZoom
    end
end)

registerForEvent("onUpdate", function()
    if zoom.zoomAllowed and zoom.config.modEnabled then
        Game.GetPlayer():GetFPPCameraComponent().zoomOverrideWeight = zoom.currentZoom
    end
end)

end

return zoom:new()