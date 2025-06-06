local scoreboardOpen = false
local players = {}

-- Register key mapping for scoreboard toggle (customizable in FiveM settings)
RegisterKeyMapping('scoreboard', 'Toggle Scoreboard', 'keyboard', 'DOWN')

-- Command to toggle scoreboard
RegisterCommand('scoreboard', function()
    toggleScoreboard()
end, false)

-- Function to toggle scoreboard
function toggleScoreboard()
    scoreboardOpen = not scoreboardOpen
    
    if scoreboardOpen then
        -- Request player data from server
        TriggerServerEvent('scoreboard:requestPlayers')
        SetNuiFocus(false, false)
    end
    
    -- Send NUI message to show/hide scoreboard
    SendNUIMessage({
        type = 'toggleScoreboard',
        display = scoreboardOpen,
        players = players
    })
end

-- Receive player data from server
RegisterNetEvent('scoreboard:receivePlayers')
AddEventHandler('scoreboard:receivePlayers', function(playerData)
    players = playerData
    
    if scoreboardOpen then
        SendNUIMessage({
            type = 'updatePlayers',
            players = players
        })
    end
end)

-- Update scoreboard while open
Citizen.CreateThread(function()
    while true do
        if scoreboardOpen then
            TriggerServerEvent('scoreboard:requestPlayers')
        end
        Citizen.Wait(2000) -- Update every 2 seconds
    end
end)

-- Close scoreboard when ESC is pressed
Citizen.CreateThread(function()
    while true do
        if scoreboardOpen and IsControlJustPressed(0, 322) then -- ESC key
            scoreboardOpen = false
            SendNUIMessage({
                type = 'toggleScoreboard',
                display = false
            })
        end
        Citizen.Wait(0)
    end
end)

-- Alternative: You can also add a chat command for opening scoreboard
RegisterCommand('sb', function()
    toggleScoreboard()
end, false)