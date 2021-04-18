input = {}

function input.startInputObserver(zoom)
    Observe('PlayerPuppet', 'OnAction', function(action)
        local actionName = Game.NameToString(action:GetName(action))
        local actionType = action:GetType(action).value
        if actionName == 'RangedADS' then
            if actionType == 'BUTTON_HOLD_COMPLETE' then
                local weapon = Game.GetTransactionSystem():GetItemInSlot(Game.GetPlayer(), TweakDBID.new('AttachmentSlots.WeaponRight'))
                local id = weapon:GetItemID()
                local itemRecord = Game['gameRPGManager::GetItemRecord;ItemID'](id)
                local weaType = itemRecord:ItemType():Type().value
                local hasScope = false
                local itemParts = Game['ItemModificationSystem::GetAllSlots;GameObjectItemID'](Game.GetPlayer(), id)
                for _, part in pairs(itemParts) do
                    if part.installedPart.tdbid.hash ~= 0 then
                        if (tostring(part.slotID) == tostring(TweakDBID.new("AttachmentSlots.Scope"))) then hasScope = true end
                    end
                end

                local weaponAllowed = false
                pcall(function ()
                    weaponAllowed = zoom.config[weaType].enabled
                end)

                if weaponAllowed then
                    zoom.totalZoomLevels = zoom.config[weaType].levels
                    zoom.zoomIncrement = zoom.config[weaType].amount
                    if zoom.config[weaType].scopeNeeded then
                        if hasScope then
                            zoom.zoomAllowed = true
                            zoom.currentZoom = Game.GetPlayer():GetFPPCameraComponent().zoomOverrideWeight
                            zoom.weaDefaultZoom = Game.GetPlayer():GetFPPCameraComponent().zoomOverrideWeight
                        end
                    else
                        zoom.zoomAllowed = true
                        zoom.currentZoom = Game.GetPlayer():GetFPPCameraComponent().zoomOverrideWeight
                        zoom.weaDefaultZoom = Game.GetPlayer():GetFPPCameraComponent().zoomOverrideWeight
                    end
                else
                    zoom.zoomAllowed = false
                end
                zoom.zoomLevel = 0
            elseif actionType == "BUTTON_RELEASED" then
                zoom.zoomAllowed = false
            end
        end
    end)
end

return input