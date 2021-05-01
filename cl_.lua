local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

clgg = Tunnel.getInterface("juan-pvp")
vRP = Proxy.getInterface("vRP")
vRPclient = Proxy.getInterface("vRP")

----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local hff
local toggleFly = false
local inLobby = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOBBYCOMMAND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('lobby',function()
    local ped = PlayerPedId()

    local playerPed = GetPlayerPed(-1)
    TriggerServerEvent('dimension')
    RemoveAllPedWeapons(playerPed,false)

    SetEntityCoords(ped,-1851.58,-1233.75,13.03+0.001,250.02+0.0001,1,0,0,1)

    local hff = RegisterPedheadshot(PlayerPedId())
    Wait(200)

    TriggerEvent("Notify",'aviso',"Lobby ManagerSeja bem-vindo novamente ao Lobby.")


    FreezeEntityPosition(ped,false)
    SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true)
    SetEntityHealth(ped,399)

end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CODE
-----------------------------------------------------------------------------------------------------------------------------------------

local random = {
    [1] = { ['x'] = 2503.7, ['y'] = -339.45, ['z'] = 92.75},
    [2] = { ['x'] = 2500.62, ['y'] = -296.0, ['z'] = 92.99},
    [3] = { ['x'] = 2542.62, ['y'] = -338.32, ['z'] = 94.08},
    [4] = { ['x'] = 2541.02, ['y'] = -448.82, ['z'] = 92.75},
    [5] = { ['x'] = 2503.53, ['y'] = -458.9, ['z'] = 92.87},
    [6] = { ['x'] = 2434.57, ['y'] = -414.4, ['z'] = 93.0},
    [7] = { ['x'] = 2460.31, ['y'] = -385.66, ['z'] = 93.31},

}
local randomf = {
    [1] = { ['x'] = -1172.86, ['y'] = -508.88, ['z'] = 35.57},
    [2] = { ['x'] = -1043.54, ['y'] = -524.54, ['z'] = 36.04},
    [3] = { ['x'] = -1152.05, ['y'] = -457.29, ['z'] = 34.8},
    [4] = { ['x'] = -1201.92, ['y'] = -447.88, ['z'] = 33.58},
    [5] = { ['x'] = -1173.98, ['y'] = -529.57, ['z'] = 30.42},
    [6] = { ['x'] = -1142.7, ['y'] = -590.59, ['z'] = 29.61},
    [7] = { ['x'] = -1066.26, ['y'] = -487.29, ['z'] = 36.67},

}




local pedlist = {
	{ ['x'] = -1842.02, ['y'] = -1199.34, ['z'] = 14.31, ['h'] = 242.68643188477, ['hash'] = 0xC8BB1E52, ['hash2'] = "u_m_y_mani" },
	{ ['x'] = -1820.03, ['y'] = -1219.98, ['z'] = 13.02, ['h'] = 38.054275512695, ['hash'] = 0x999B00C6, ['hash2'] = "ig_paper" },
}

Citizen.CreateThread(function()
	for k,v in pairs(pedlist) do
		RequestModel(GetHashKey(v.hash2))
		while not HasModelLoaded(GetHashKey(v.hash2)) do
			Citizen.Wait(10)
		end

		local ped = CreatePed(4,v.hash,v.x,v.y,v.z-1,v.h,false,true)
		FreezeEntityPosition(ped,true)
		SetEntityInvincible(ped,true)
		SetBlockingOfNonTemporaryEvents(ped,true)
	end
end)

local pistolclick = {
    {-1841.47,-1199.59,14.31}
}

Citizen.CreateThread(function()
    while true do
        Wait(4)
        local coordPed = GetEntityCoords(PlayerPedId())
        local coords = vector3(-1841.47,-1199.59,14.31)
        local dist = #(coordPed - coords)
        if dist < 2 then
            for k,v in pairs(pistolclick) do
                drawTxt('PRESSIONE ~r~E ~w~ PARA  ~r~ZONA DA PISTOL', 4,0.5,0.96,0.45,255,255,255,255)
                if IsControlJustPressed(0,38) then
                    TriggerServerEvent('dimension')
                    selecionado = math.random(7)
                    SetEntityCoords(PlayerPedId(), random[selecionado].x,random[selecionado].y,random[selecionado].z)
                end
            end
        end
    end
end)


local fuzilclick = {
    {-1820.58,-1219.33,13.02}
}

Citizen.CreateThread(function()
    while true do
        Wait(4)
        local coordPeds = GetEntityCoords(PlayerPedId())
        local coordss = vector3(-1820.52,-1219.53,13.02)
        local dist = #(coordPeds - coordss)
        if dist < 2 then
            for k,v in pairs(fuzilclick) do
                drawTxt('PRESSIONE ~r~E ~w~ PARA  ~r~ZONA DE FUZIL', 4,0.5,0.96,0.45,255,255,255,255)
                if IsControlJustPressed(0,38) then
                    print('teste')
                    TriggerServerEvent('dimension:fuzil')
                    selecionado = math.random(7)
                    SetEntityCoords(PlayerPedId(), randomf[selecionado].x,randomf[selecionado].y,randomf[selecionado].z)
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DWTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(6)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/370
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end
