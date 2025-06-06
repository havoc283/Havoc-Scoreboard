A lightweight, framework-independent scoreboard script for FiveM servers that displays online players, their IDs, names, and ping in a clean, modern interface.

## Features

- 🎮 **Framework Independent** - No ESX, QBCore, or other framework required
- ⌨️ **Customizable Keybind** - Players can set their own preferred key in FiveM settings
- 🔄 **Real-time Updates** - Player list updates every 2 seconds while open
- 🎨 **Modern UI** - Clean, responsive design with hover effects
- 📱 **Multiple Access Methods** - Keybind, chat commands, and customizable options

## Preview

![Scoreboard Preview](https://raw.githubusercontent.com/havoc283/Havoc-Scoreboard/main/img/QsVVSPW.png)

The scoreboard displays:
- Current player count
- Server name
- Player ID, Name, and Ping in a sortable table
- 
## Installation

1. **Add to server.cfg**
   ```
   ensure scoreboard
   ```

2. **Restart your server** or use `refresh` and `start scoreboard`

## Usage

### Default Controls
- **Down Arrow Key** - Toggle scoreboard (customizable)
- **ESC Key** - Close scoreboard
- **Chat Commands:**
  - `/scoreboard` - Toggle scoreboard
  - `/sb` - Quick toggle (shorter command)

### Customizing Keybind
Players can customize their keybind by:
1. Opening FiveM Settings (ESC → Settings)
2. Going to Key Bindings
3. Finding "Toggle Scoreboard"
4. Setting their preferred key

## Configuration

### Server Name
To change the server name displayed on the scoreboard:
1. Open `html/index.html`
2. Find line: `<span>Server: YourServerName</span>`
3. Replace "YourServerName" with your server's name

### Styling
The scoreboard's appearance can be customized by editing the CSS in `html/index.html`:
- Colors and transparency
- Fonts and sizes
- Layout and positioning

### Update Interval
To change how often the scoreboard updates:
1. Open `client.lua`
2. Find: `Citizen.Wait(2000)` (line ~50)
3. Change 2000 to your preferred milliseconds (1000 = 1 second)

## Customization Examples

### Adding Player Money Display
```lua
-- In server.lua, modify the player data collection:
table.insert(playerData, {
    id = playerId,
    name = playerName,
    ping = playerPing,
    money = GetPlayerMoney(playerId) -- Your money function here
})
```

### Changing Default Keybind
```lua
-- In client.lua, change the RegisterKeyMapping:
RegisterKeyMapping('scoreboard', 'Toggle Scoreboard', 'keyboard', 'F1')
```

## Troubleshooting

### Scoreboard won't open
- Check console for errors (F8)
- Ensure resource is started: `ensure simple-scoreboard`

### Keybind not working
- Try using chat commands `/scoreboard` or `/sb`
- Check FiveM keybind settings for conflicts
- Restart FiveM client if keybind was recently changed

### Players not showing
- Check server console for errors
- Ensure GetPlayers() function is working
  
### UI not displaying correctly
- Clear FiveM cache

## Performance

This script is designed to be lightweight:
- Only updates when scoreboard is open
- Minimal resource usage when closed
- Efficient player data collection
- No database dependencies


## Support

For issues, suggestions, or customization help:
- Check the troubleshooting section above
- Review the configuration options
- Ensure proper installation steps were followed

## License

This script is provided as-is for educational and community use. Feel free to modify and distribute according to your server's needs.

---

**Version:** 1.0.0  
**Author:** Havoc 
**Last Updated:** 2025
