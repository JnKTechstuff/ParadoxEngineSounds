RegisterCommand('engineAudio', function(source, args)
    if args[1] then
        if Config.UsePermissions then
            if source == 0 or not IsPlayerAceAllowed(source, "paradox.enginesound") then
                print('No permission!')
                return
            end
        end 
        local ped = GetPlayerPed(source)
        local vehicle = GetVehiclePedIsIn(ped)
        if vehicle and vehicle > 0 and Config.EngineSounds[args[1]] then
            print('Set engine to:', Config.EngineSounds[args[1]])
            Entity(vehicle).state.engineSound = Config.EngineSounds[args[1]]
            TriggerClientEvent('ParadoxEngineSounds:client:audioSet', source, Config.EngineSounds[args[1]])
        else
            print('No vehicle or invalid engine')
        end
    else
        print('No arguments provided!')
    end
end, false)