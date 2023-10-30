

local stats = {100,100}

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


CreateThread(function()
    while true do
        Citizen.Wait(500)
        local  health = gethelt()
        local armor = getarmor()
        local stamina = getstamina()
        local stats = getstats()

    SendNUIMessage({
        health = health,
        armor = armor,
        stamina = stamina,
        hunger = stats[1],
        thirst = stats[2],
    })
    
 
        
    end
    
end)

RegisterCommand('sh', function (src,args)
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
    
    
end,false)