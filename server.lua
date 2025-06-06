-- Handle player data request
RegisterNetEvent('scoreboard:requestPlayers')
AddEventHandler('scoreboard:requestPlayers', function()
    local src = source
    local playerData = {}
    
    -- Get all connected players
    local players = GetPlayers()
    
    for i = 1, #players do
        local playerId = tonumber(players[i])
        local playerName = GetPlayerName(playerId)
        local playerPing = GetPlayerPing(playerId)
        
        -- Skip if player data is invalid
        if playerName and playerPing then
            table.insert(playerData, {
                id = playerId,
                name = playerName,
                ping = playerPing
            })
        end
    end
    
    -- Sort players by ID
    table.sort(playerData, function(a, b)
        return a.id < b.id
    end)
    
    -- Send data back to client
    TriggerClientEvent('scoreboard:receivePlayers', src, playerData)
end)