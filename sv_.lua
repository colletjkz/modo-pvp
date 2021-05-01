local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
clgg = {}
Tunnel.bindInterface("juan-pvp",clgg)


RegisterNetEvent("dimension:pistol")
    AddEventHandler("dimension:pistol",function()
    local source = source
    SetPlayerRoutingBucket(source,1)
    end)
    
    RegisterNetEvent("dimension:fuzil")
    AddEventHandler("dimension:fuzil",function()
    local source = source
    SetPlayerRoutingBucket(source,2)
    end)
    
    RegisterNetEvent("dimension")
    AddEventHandler("dimension",function()
    local source = source
    SetPlayerRoutingBucket(source,0)
    end)

