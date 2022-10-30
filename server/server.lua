local QRCore = exports['qr-core']:GetCoreObject()

-- use canoe
QRCore.Functions.CreateUseableItem("canoe", function(source, item)
    local src = source
	TriggerClientEvent('rsg-canoe:client:lauchcanoe', src, item.name)
end)
