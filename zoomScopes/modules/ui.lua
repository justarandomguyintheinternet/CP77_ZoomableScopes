ui = {}

function ui.draw(zoom)
	if (ImGui.Begin("Zoom Levels", ImGuiWindowFlags.AlwaysAutoResize)) then
        ImGui.BeginChild("general", 300, 60, true)
        zoom.config.modEnabled, changed = ImGui.Checkbox("Mod enabled", zoom.config.modEnabled)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        if ImGui.Button("Reset Settings") then
            zoom.fileSys.saveFile("config/config.json", zoom.defaultSettings)
            zoom.config = zoom.fileSys.loadFile("config/config.json")
        end
        ImGui.EndChild()

        ImGui.BeginChild("sniper", 300, 125, true)
        ImGui.Text("Sniper")
        ImGui.Separator()
        zoom.config["Wea_SniperRifle"].enabled, changed = ImGui.Checkbox("Enable Zoom", zoom.config["Wea_SniperRifle"].enabled)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        zoom.config["Wea_SniperRifle"].scopeNeeded, changed = ImGui.Checkbox("Require Scope for zoom", zoom.config["Wea_SniperRifle"].scopeNeeded)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        ImGui.PushItemWidth(125)
        zoom.config["Wea_SniperRifle"].levels, changed = ImGui.InputInt("Zoom Levels", zoom.config["Wea_SniperRifle"].levels, 1, 10)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        zoom.config["Wea_SniperRifle"].amount, changed = ImGui.InputInt("Zoom Level Strength", zoom.config["Wea_SniperRifle"].amount, 1, 10)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        ImGui.PopItemWidth(125)
        ImGui.EndChild()

        ImGui.BeginChild("precision", 300, 125, true)
        ImGui.Text("Precision Rifle")
        ImGui.Separator()
        zoom.config["Wea_PrecisionRifle"].enabled, changed = ImGui.Checkbox("Enable Zoom", zoom.config["Wea_PrecisionRifle"].enabled)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        zoom.config["Wea_PrecisionRifle"].scopeNeeded, changed = ImGui.Checkbox("Require Scope for zoom", zoom.config["Wea_PrecisionRifle"].scopeNeeded)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        ImGui.PushItemWidth(125)
        zoom.config["Wea_PrecisionRifle"].levels, changed = ImGui.InputInt("Zoom Levels", zoom.config["Wea_PrecisionRifle"].levels, 1, 10)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        zoom.config["Wea_PrecisionRifle"].amount, changed = ImGui.InputInt("Zoom Level Strength", zoom.config["Wea_PrecisionRifle"].amount, 1, 10)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        ImGui.PopItemWidth(125)
        ImGui.EndChild()

        ImGui.BeginChild("lmg", 300, 125, true)
        ImGui.Text("LMG")
        ImGui.Separator()
        zoom.config["Wea_LightMachineGun"].enabled, changed = ImGui.Checkbox("Enable Zoom", zoom.config["Wea_LightMachineGun"].enabled)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        zoom.config["Wea_LightMachineGun"].scopeNeeded, changed = ImGui.Checkbox("Require Scope for zoom", zoom.config["Wea_LightMachineGun"].scopeNeeded)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        ImGui.PushItemWidth(125)
        zoom.config["Wea_LightMachineGun"].levels, changed = ImGui.InputInt("Zoom Levels", zoom.config["Wea_LightMachineGun"].levels, 1, 10)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        zoom.config["Wea_LightMachineGun"].amount, changed = ImGui.InputInt("Zoom Level Strength", zoom.config["Wea_LightMachineGun"].amount, 1, 10)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        ImGui.PopItemWidth(125)
        ImGui.EndChild()

        ImGui.BeginChild("rifle", 300, 125, true)
        ImGui.Text("Assault Rifle")
        ImGui.Separator()
        zoom.config["Wea_Rifle"].enabled, changed = ImGui.Checkbox("Enable Zoom", zoom.config["Wea_Rifle"].enabled)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        zoom.config["Wea_Rifle"].scopeNeeded, changed = ImGui.Checkbox("Require Scope for zoom", zoom.config["Wea_Rifle"].scopeNeeded)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        ImGui.PushItemWidth(125)
        zoom.config["Wea_Rifle"].levels, changed = ImGui.InputInt("Zoom Levels", zoom.config["Wea_Rifle"].levels, 1, 10)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        zoom.config["Wea_Rifle"].amount, changed = ImGui.InputInt("Zoom Level Strength", zoom.config["Wea_Rifle"].amount, 1, 10)
        if changed then zoom.fileSys.saveFile("config/config.json", zoom.config) end
        ImGui.PopItemWidth(125)
        ImGui.EndChild()

        ImGui.End()
	end
end

return ui