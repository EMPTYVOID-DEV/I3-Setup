![I3-image](./assets/images/i3-setup)

# I3-Setup

In this repository, I present my humble Linux i3 configuration. I use the following packages:

- **i3-gaps-rounded:** A fork of i3, a tiling window manager with rounded corners.
- **kitty:** A fast and customizable terminal.
- **Rofi:** A versatile window launcher, file browser, and more.
- **Polybar:** Primarily designed to help users create impressive status bars, it includes built-in functionality to display information about commonly used services.
- **Betterlockscreen:** An excellent lock screen that seamlessly integrates with tiling window managers.

## Dependencies

Before getting started, ensure you have the following packages installed:

- [i3-gaps-rounded](https://github.com/jbenden/i3-gaps-rounded)
- [kitty](https://github.com/kovidgoyal/kitty)
- [polybar](https://github.com/polybar/polybar)
- [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen)
- [rofi](https://github.com/davatorium/rofi)
- [feh image viewer](https://github.com/derf/feh)
- [blueman, a Bluetooth manager](https://github.com/blueman-project/blueman)
- [brightnessctl](https://github.com/Hummer12007/brightnessctl)
- [JetBrains Mono font](https://www.jetbrains.com/lp/mono/)
- [FontAwesome](https://fontawesome.com/download)
- [Noto Sans Modi](https://www.cufonfonts.com/font/noto-sans-modi)

## Installation

1. Clone the repository:

```bash
git clone https://github.com/Shinji13/I3-Setup
```

2. Navigate to the directory and provide execute permission to the install script.

```bash
 cd I3-Setup
 chmod +x setup.sh
```

3. Run install.sh and select a theme.

```bash
./install.sh
```

This script will configure the files for you. Reload i3 with `Win+Shift+R`, and you're good to go.

#### Note

**setup.sh** will override your current configurations for the mentioned packages, so consider backing up any necessary files.

## Unit Files

Some systemd unit files need to be added to your system.

#### `betterlockscreen.service`

This service manages screen locking on suspend and sleep.

1. Copy the unit file.

```bash
cp ./units/betterLockScreen.service /usr/lib/systemd/system/
```

2. Enable the service.

```bash
sudo systemctl enable betterLockScreen.service
```

## Contribution

Contributions are welcome! If you find issues or have suggestions for improvement, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](https://opensource.org/license/mit/)
