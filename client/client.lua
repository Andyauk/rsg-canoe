local RSGCore = exports['rsg-core']:GetCoreObject()
local boatout = false

RegisterNetEvent('rsg-canoe:client:lauchcanoe')
AddEventHandler('rsg-canoe:client:lauchcanoe', function()
    local hasItem = RSGCore.Functions.HasItem('canoe', 1)
    if hasItem then
        if boatout == false then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            
            -- Increase the range to check for water
            local water = Citizen.InvokeNative(0x5BA7A68A346A5A91, coords.x, coords.y, coords.z)
            
            -- Check if the player is in water
            if water then
                local canLaunch = false
                local playerPos = GetEntityCoords(ped)
                
                -- Iterate through water areas to find if the player is in one
                for k, v in pairs(Config.WaterTypes) do
                    local waterType = Config.WaterTypes[k].waterhash
                    if water == waterType and IsEntityInWater(ped) then
                        canLaunch = true
                        break
                    end
                end
                
                if canLaunch then
                    local canoeModel = `CANOE`
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 4.0, 0.5))
                    local heading = GetEntityHeading(ped)
                    RequestModel(canoeModel)
                    while not HasModelLoaded(canoeModel) do
                        Citizen.Wait(500)
                    end
                    activeboat = CreateVehicle(canoeModel, x, y, z, heading, 1, 1)
                    SetVehicleOnGroundProperly(activeboat)
                    SetPedIntoVehicle(ped, activeboat, -1)
                    SetModelAsNoLongerNeeded(canoeModel)
                    boatout = true
                else
                    lib.notify({ title = Lang:t('error.not_in_correct_water'), duration = 5000, type = 'error' })
                end
            else
                lib.notify({ title = Lang:t('error.cant_take_out_boat'), duration = 5000, type = 'error' })
            end
        else
            lib.notify({ title = Lang:t('error.boat_already_out'), duration = 5000, type = 'error' })
        end
    else
        lib.notify({ title = Lang:t('error.no_item'), duration = 5000, type = 'error' })
    end
end)

-- delete canoe
RegisterCommand('delcanoe', function()
    SetEntityAsMissionEntity(activeboat, true, true)
    DeleteVehicle(activeboat)
    boatout = false
end)
