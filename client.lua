AddStateBagChangeHandler('tunerData' --[[key filter]], nil --[[bag filter]], function(bagName, key, value, _unused, replicated)
    Wait(250)
    print('Set audio', value)
    if not value then return end
    local entNet = tonumber(bagName:gsub('entity:', ''), 10)
    local vehicle = NetworkGetEntityFromNetworkId(entNet)
    if vehicle and vehicle ~= 0 then
        ForceVehicleEngineAudio(vehicle, value)
    end
end)

RegisterNetEvent('ParadoxEngineSounds:client:audioSet', function(audio)
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    if vehicle and vehicle > 0 then
        print('Force audio to:', audio)
        ForceVehicleEngineAudio(vehicle, audio)
    end    
end)