local QBCore = exports['qb-core']:GetCoreObject()

--[[ AddEventHandler('hunger-percent',function(src)
 local Player = QBCore.Functions.GetPlayer(src)
 local hunger = Player.PlayerData.metadata['hunger']
 print(hunger + ' 1')
 
 return hunger
  

end) ]]
RegisterNetEvent('hunger', function(src,args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local newHunger = Player.PlayerData.metadata['hunger']
    return newHunger
end)
    