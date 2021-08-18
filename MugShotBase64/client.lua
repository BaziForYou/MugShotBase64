local id = 0
local MugshotsCache = {}
local Answers = {}

function GetMugShotBase64(Ped,Tasparent)
	if not Ped then return end
	id = id + 1 
	
	local Handle
	
	if Tasparent then
		Handle = RegisterPedheadshotTransparent(Ped)
	else
		Handle = RegisterPedheadshot(Ped)
	end
	
	local timer = 2000
	while ((not Handle or not IsPedheadshotReady(Handle) or not IsPedheadshotValid(Handle)) and timer > 0) do
		Citizen.Wait(10)
		timer = timer - 10
	end

	local MugShotTxd = 'none'
	if (IsPedheadshotReady(Handle) and IsPedheadshotValid(Handle)) then
		MugshotsCache[id] = Handle
		MugShotTxd = GetPedheadshotTxdString(Handle)
	end

	SendNUIMessage({
		type = 'convert',
		pMugShotTxd = MugShotTxd,
		id = id,
	})
	
	while not Answers[id] do
		Citizen.Wait(10)
	end
	
	if MugshotsCache[id] then
		UnregisterPedheadshot(MugshotsCache[id])
		MugshotsCache[id] = nil
	end
	
	local CallBack = Answers[id]
	Answers[id] = nil
	
	return CallBack
end

RegisterNUICallback('Answer', function(data)
	Answers[data.Id] = data.Answer
end)


AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  for k,v in pairs(MugshotsCache) do
	UnregisterPedheadshot(v)
  end
end)

RegisterCommand("base64mugshotNormal",function(source,args,rawCommand)
	print(GetMugShotBase64(GetPlayerPed(-1),false))
end,false)

RegisterCommand("base64mugshotTrasParent",function(source,args,rawCommand)
	print(GetMugShotBase64(GetPlayerPed(-1),true))
end,false)