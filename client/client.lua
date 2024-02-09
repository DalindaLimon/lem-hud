local seatbeltOn = exports["qb-smallresources"]:hasSeatbelt()
local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('qb-smallresources:seatbelt:client:ToggleSeatbelt', function() -- Triggered in smallresources
    seatbeltOn = not seatbeltOn
    
end)
local function toggleseatbelt()
    if not IsPedInAnyVehicle(PlayerPedId(), false) or IsPauseMenuActive() then return end
    local class = GetVehicleClass(GetVehiclePedIsUsing(PlayerPedId()))
    if class == 8 or class == 13 or class == 14 then return end
    TriggerEvent("qb-smallresources:seatbelt:client:ToggleSeatbelt")
    print(seatbeltOn)
end
    

RegisterCommand('toggleseatbelt', function()
toggleseatbelt()
end,false)

RegisterKeyMapping('toggleseatbelt', 'Toggle Seatbelt', 'keyboard', 'K')

local stats = {100,100}
local function oxygen()
    local ped = PlayerPedId()
    local oxygen = GetPlayerUnderwaterTimeRemaining(ped)
    return oxygen   
end
local function gethelt()
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)
    local mhealth =  GetEntityMaxHealth(ped)
    if mhealth > 100 then
        return health-100
    else
    return health
    end
    
end
local function IsinVehicle()
    local ped = PlayerPedId()
 if IsPedSittingInAnyVehicle(ped) then
    DisplayRadar(true)
    return true

 else
    DisplayRadar(false)
    return false
 end

end

local function getarmor()
    local ped = PlayerPedId()
    local armor = GetPedArmour(ped)
    return armor 
end
local function getstamina()
    local ped = PlayerId()
    local stamina = GetPlayerStamina(ped)
    return stamina
end

local function getstats()
    RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst) -- Triggered in qb-core
        hunger = newHunger
        thirst = newThirst
    end)
    if hunger == nil or hunger>100 or thirst > 100 then 
    hunger = 100
    thirst = 100
    end
    local stats =  {hunger,thirst}
   return stats 
end
local function getvehicle()
    local ped = PlayerPedId()
    if IsPedSittingInAnyVehicle(ped) then
    local vehicle = GetVehiclePedIsIn(ped,false)
    local vehiclespeed = GetEntitySpeed(vehicle)
    local vehiclerpm = GetVehicleDashboardRpm()
    local stats = {vehiclespeed,vehiclerpm}
    return stats
    else 
        return stats
    end
end
local function NUI(health,armor,stamina,stats,vehicle,IsinVehicle,oxygen,seatbelt)
    SendNUIMessage({
        health = health,
        armor = armor,
        stamina = stamina,
        hunger = stats[1],
        thirst = stats[2],
        vehiclespeed = vehicle[1]*3.6,
        vehiclerpm = vehicle[2],
        IsinVehicle = IsinVehicle,
        oxygen = oxygen,
        seatbelt = seatbelt,

    })
    
end
CreateThread(function()
    while true do
        if IsinVehicle then
            local  health = gethelt()
            local armor = getarmor()
            local stamina = getstamina()
            local oxygen = oxygen()
            local stats = getstats()
            local IsinVehicle = IsinVehicle()
            local vehicle = getvehicle()
            local seatbelt = seatbeltOn
            NUI(health,armor,stamina,stats,vehicle,IsinVehicle,oxygen,seatbelt)
            Citizen.Wait(100)
            
            
        else
            
            local  health = gethelt()
            local armor = getarmor()
            local stamina = getstamina()
            local oxygen = oxygen()
            local stats = getstats()
            local vehicle = getvehicle()
            local IsinVehicle = IsinVehicle()
            local seatbelt = seatbeltOn
            
            NUI(health,armor,stamina,stats,vehicle,IsinVehicle,oxygen,seatbelt)
            Citizen.Wait(500)
        end
    
 
        
    end
    
end)




--[[TEST COMMANDS FOR DEVELOPMENT]]
--[[ RegisterCommand('sh', function (src,args) -----> test commands for set health(sh) set armor (ah)


++
    local ped= PlayerPedId()
    local args = tonumber(args[1])
    local mhealth =  GetEntityMaxHealth(ped)
    local health = GetEntityHealth(ped)
    if mhealth > 100 then
        args = args+100
        SetEntityHealth(ped,args)
    else
        SetEntityHealth(ped,args)
    end
    print(args)
    
    
end,false)

RegisterCommand('ah', function (src,args)
    local ped= PlayerPedId()
    local args = tonumber(args[1])
    local health = GetPedArmour(ped)
        SetPedArmour(ped,args)
        

    print(args)
    
    
end,false) ]]