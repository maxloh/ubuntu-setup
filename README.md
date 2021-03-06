# ubuntu-setup

## Setup

- 
  ```bash
  chmod +x ./setup.sh
  ./setup.sh
  
  chmod +x ./install_firacode.sh
  ./install_firacode.sh
  ```
  
- Install [Chrome](https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb)

- Install [GNOME Shell integration extension](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)

  - Install [Dash to Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/), [User Themes](https://extensions.gnome.org/extension/19/user-themes/), [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/), [Emoji Selector](https://extensions.gnome.org/extension/1162/emoji-selector/)

- Cangjie

  - After restart, add Cangjie input method in Settings → Region & Language → + → ⁝ → Other → Chinese (Cangjie)

## Customizations

- Cursors

  - [Bibata](https://github.com/ful1e5/Bibata_Cursor)

- grub

  - Skip grub menu on boot ([source](https://askubuntu.com/a/1036957))

    - 
      ```
      sudo gedit /etc/default/grub
      ```

    - Set `GRUB_TIMEOUT` to `0.1` ( `GRUB_TIMEOUT=0.1` )

    - 
      ```
      sudo update-grub
      ```

  - [Stylish grub theme](https://www.gnome-look.org/p/1009237/) ([GitHub](https://github.com/vinceliuice/grub2-themes))

- Visual Studio Code
    
  - Change UI font (run after every update)
  
    ```
    sudo sed -i 's/Ubuntu,/Roboto,Ubuntu,/g' /usr/share/code-insiders/resources/app/out/vs/workbench/workbench.desktop.main.css
    ```

  - Reset panel size

    Delete directory `~/.config/Code - Insiders/User/globalStorage/`

## Programs

### Customization

- Grub Customizer

  ```bash
  sudo apt install grub-customizer
  ```

- mate-mouse-properties (mouse settings)

  ```bash
  sudo apt install mate-mouse-properties
  ```
  
### Utilities

- GParted (disk partition)

  ```bash
  sudo apt install gparted
  ```

- [Stacer](https://github.com/oguzhaninan/Stacer/releases) (task Manager)

- https://launchpad.net/ubuntu/+source/ksysguard

- http://docfetcher.sourceforge.net/en/index.html

- https://www.lesbonscomptes.com/recoll/

- https://docs.xfce.org/apps/catfish/start

- https://github.com/yatima1460/Drill

### Development

- [Visual Studio Code](https://code.visualstudio.com/)
  
- [Github desktop (Linux fork)](https://github.com/shiftkey/desktop/releases)

### Others

- [Anbox](https://docs.anbox.io/userguide/install.html) (Android Apps)

- [ibus-table-chinese](https://github.com/definite/ibus-table-chinese)

## Useful commands

- List manually installed packages [(source)](https://askubuntu.com/a/492343)

  ```
  comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
  ```
- List removed preinstalled packages

  <!--
  ```
  # WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
  # <(apt list --installed | sed -n 's/[//].*//p' | sort -u)
  # <(apt list --installed | awk -F '/' '{print $1}' | sort -u)
  # <( (apt-mark showmanual; apt-mark showauto) | cat | sort -u)
  comm -23 <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) <(dpkg -l | grep ^ii | awk '{print $2}' | awk -F: '{print $1}' | sort -u) 
  ```
  
  ```
  initial_ubuntu_version="19.10"
  current_ubuntu_version="20.04"
  comm -23 \
    <(
      # All removed preinstalled packages, excluding dependencies
      comm -23 \
        <( comm -23 <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) <(dpkg -l | grep ^ii | awk -F"[ :]" '{print $3}' | sort -u) ) \
        <( gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Depends: //p' | awk '{split($0, packages, ", |\| "); for (key in packages) { printf "%s\n", packages[key] } }' | awk '{print $1}' | sort -u )
    ) \
    <(
      # Packages being removed during system update
      comm -23 \
        <( wget "http://releases.ubuntu.com/$initial_ubuntu_version/ubuntu-$initial_ubuntu_version-desktop-amd64.manifest" -q -O - | cut -f 1 | awk -F"[ :]" '{print $1}' | sort -u ) \
        <( wget "http://releases.ubuntu.com/$current_ubuntu_version/ubuntu-$current_ubuntu_version-desktop-amd64.manifest" -q -O - | cut -f 1 | awk -F"[ :]" '{print $1}' | sort -u )
    )
  ```
  
  ```
  comm -23 \
    <(apt depends ubuntu-desktop | sed 's/Depends: //; s/Recommends: //; s/:i386//' | awk '{$1=$1};1' | sort -u) \
    <({ apt-mark showauto & apt-mark showmanual; } | sort -u)
    
  ```
  -->
  ```
  comm -23 \
    <(apt depends ubuntu-desktop | sed -n 's/Depends: //p; s/Recommends: //p' | awk '{$1=$1};1' | sort -u) \
    <({ apt-mark showauto & apt-mark showmanual; } |  sort -u)
  ```
