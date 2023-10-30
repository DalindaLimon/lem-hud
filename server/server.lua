local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('hunger', function(src,args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local newHunger = Player.PlayerData.metadata['hunger']
    return newHunger
end)
    
