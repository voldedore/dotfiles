# My .files

Master branch is deprecated, just for documentation.

Switch to [`linux`](https://github.com/voldedore/dotfiles/tree/linux) or [`macos`](https://github.com/voldedore/dotfiles/tree/macos) branch for appropriate configuration.

## How to config for back up and restore to/from this repo:

Inspired from this article: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

But, a little bit different: Clone the repo to

    ~/dotfiles

Then 

    alias config='/usr/bin/git --git-dir=$HOME/dotfiles/.git/ --work-tree=$HOME'
    config config --local status.showUntrackedFiles no

After this, you can use 

    config status
    config add
    config commit

just like git command

## Others settings

### Conky

By default, `conky` uses local configfile located at `$HOME/.conkyrc` for its settings. This can be changed by recompiling from src. Or if you choose to stick to the default. Then create a link:

    ln -s ~/.config/conky/.conkyrc ~/.conkyrc
    
### i3wm

You might want to install a compositor for additional feature like transparency of X clients. E.g: `xcompmgr`

### polybar

The config of polybar displaying cpu temp may vary due to variety of hardware. 

Check for info availability by:

    $ ll /sys/class/hwmon/
    
    total 0
    drwxr-xr-x  2 root root 0 Jan  6 19:57 .
    drwxr-xr-x 62 root root 0 Jan  6 19:57 ..
    lrwxrwxrwx  1 root root 0 Jan  6 19:58 hwmon0 -> ../../devices/virtual/thermal/thermal_zone0/hwmon0
    lrwxrwxrwx  1 root root 0 Jan  6 19:58 hwmon1 -> ../../devices/platform/coretemp.0/hwmon/hwmon1

    $ ll /sys/class/hwmon/hwmon1/
    [...]
    -r--r--r-- 1 root root 4.0K Jan  7 13:44 temp1_max
    -r--r--r-- 1 root root 4.0K Jan  7 13:44 temp2_crit
    -r--r--r-- 1 root root 4.0K Jan  7 13:44 temp2_crit_alarm
    -r--r--r-- 1 root root 4.0K Jan  7 13:44 temp2_input
    -r--r--r-- 1 root root 4.0K Jan  7 13:44 temp2_label
    [...]
    
    # Somthing like the above
    
Adapt the setting in `.config/polybar/config`

    # Zone number
    thermal-zone = 1 
    # and
    hwmon-path = /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input
    
Further info (this required the `lm-sensors` package):

    $ sensors
    pch_cannonlake-virtual-0
    Adapter: Virtual device
    temp1:        +54.0°C  

    coretemp-isa-0000
    Adapter: ISA adapter
    Package id 0:  +38.0°C  (high = +82.0°C, crit = +100.0°C)
    Core 0:        +36.0°C  (high = +82.0°C, crit = +100.0°C)
    Core 1:        +38.0°C  (high = +82.0°C, crit = +100.0°C)
    Core 2:        +37.0°C  (high = +82.0°C, crit = +100.0°C)
    Core 3:        +36.0°C  (high = +82.0°C, crit = +100.0°C)
    Core 4:        +36.0°C  (high = +82.0°C, crit = +100.0°C)
    Core 5:        +41.0°C  (high = +82.0°C, crit = +100.0°C)
