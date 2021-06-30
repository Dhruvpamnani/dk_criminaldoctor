QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

-- RegisterServerEvent("chip_cDoc:takeMoney")
-- AddEventHandler("chip_cDoc:takeMoney", function()
--     local _source = source
--     local xPlayer = ESX.GetPlayerFromId(_source)
    

--     if xPlayer.getMoney() > Config.toPay then
--         xPlayer.RemoveMoney(Config.toPay) 
--         TriggerClientEvent("chip_cDoc:getHelp", source)
--     else
--         TriggerClientEvent('mythic_notify:client:SendAlert', source, 
--         { 
--             type = 'error', 
--             text = 'You dont have enough money', 
--             style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } 
--         })
--     end

-- end)

RegisterNetEvent("emma:chargehim")
AddEventHandler("emma:chargehim", function(item, count)
    local src = source

    local Player = QBCore.Functions.GetPlayer(src)

    local check = Player.PlayerData.money.cash
    
    if Player then
		if check >= Config.toPay then
            Player.Functions.RemoveMoney('cash', Config.toPay)
            TriggerClientEvent("chip_cDoc:getHelp", src)
		else
            TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
		end
    end
    

end)

RegisterNetEvent("emma:help")
AddEventHandler("emma:help", function(playertreat)

  local src = source

  local Player = QBCore.Functions.GetPlayer(src)

  TriggerClientEvent('hospital:client:Revive', src)
  print('it worked till server side')

end)