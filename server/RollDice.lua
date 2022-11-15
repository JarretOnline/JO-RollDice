Citizen.CreateThread(function() --We are using a citizen create thread that will run only 1 time. 
                                --If RollDice.UseCommand is enabled then it will create the command and a sugggestion box for it.
    if(RollDice.UseCommand)then
        RegisterCommand(RollDice.ChatCommand, function(source) --Creates the roll command.
               
        TriggerEvent("RollDice:Server:Event", source, 2, 6)


        end)
    end

end)

RegisterServerEvent('RollDice:Server:Event')
AddEventHandler('RollDice:Server:Event', function(source, dices, sides) --We are using a trigger event just so you can use this event in other places as well.
                                                                        --I mean if you do want to use the event for a Registerable item. Just call the event and send the source, dices and sides.
                                                                        --Like this: TriggerServerEvent(GetPlayerServerId(PlayerId()), dices, sides)
    local tabler = {}
    for i=1, dices do 
        table.insert(tabler, math.random(1, sides)) --Creates a table with the amount of dices. Randomises the sides eventually.
    end

    TriggerClientEvent("RollDice:Client:Roll", -1, source, RollDice.MaxDistance, tabler, sides, GetEntityCoords(GetPlayerPed(source))) --Does the roll to everyone. It checks client sided if you are within the distance.
end)
