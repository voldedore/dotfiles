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

To restore `.zshrc`, in `~`:

    config checkout .zshrc

## Others settings

### ZSH theme: Custom Powerline

Install fonts: https://github.com/powerline/fonts

### Conky

By default, `conky` uses local configfile located at `$HOME/.conkyrc` for its settings. This can be changed by recompiling from src. Or if you choose to stick to the default. Then create a link:

    ln -s ~/.config/conky/.conkyrc ~/.conkyrc
    
### i3wm

You might want to install a compositor for additional feature like transparency of X clients. E.g: ~~`xcompmgr`~~ (this compositor might cause screentearing), `picom` (or `compton`).

To screenshot, need `scrot` package. To screenshot and save to clipboard, need `xclip`.

### i3lock

The vanilla i3lock's appearance is quite boring with a snowwhite color when actived (screen locked). People tend to install the alternative: `i3lock-color`.

In fact, you may have to install this in order to make `bin/lock.sh` executable.

### polybar

- To install polybar, need: base-devel group of package.

- The config of polybar displaying cpu temp may vary due to variety of hardware. 

    Check for info availability by:
    
    ```
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
    ```

    Adapt the setting in `.config/polybar/config`

    ```
    # Zone number
    thermal-zone = 1 
    # and
    hwmon-path = /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input
    ```

    Further info (this required the `lm-sensors` package):

    ```
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
    ```
    
- Display in the right monitor

    In this config, there are 2 instances of polybar (one in the top and another in the bottom). The launch script (`launch.sh`) will check for each monitor and display the top one in ONLY one monitor. 
    
    Adapt it by the output of `xrandr` (and of course, this required `xrandr` package).
    
    ```
    $xrandr -q                                                                                             
    Screen 0: minimum 320 x 200, current 3000 x 1920, maximum 16384 x 16384
    DP-1 disconnected primary (normal left inverted right x axis y axis)
    HDMI-1 disconnected (normal left inverted right x axis y axis)
    DP-2 connected 1080x1920+1920+0 left (normal left inverted right x axis y axis) 527mm x 296mm
       1920x1080     60.00*+  50.00    59.94  
       1920x1080i    60.00    50.00    59.94  
       1600x900      60.00  
       1280x1024     75.02    60.02  
       1152x864      75.00  
       1280x720      60.00    50.00    59.94  
       1024x768      75.03    60.00  
       800x600       75.00    60.32  
       720x576       50.00  
       720x480       60.00    59.94  
       640x480       75.00    60.00    59.94  
       720x400       70.08  
    DP-3 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 477mm x 268mm
       1920x1080     60.00*+
       1680x1050     59.95  
       1600x900      60.00  
       1280x1024     60.02  
       1440x900      59.89  
       1280x800      59.81  
       1280x720      60.00  
       1024x768      60.00  
       800x600       60.32  
       640x480       59.94  
       720x400       70.08  
    ```

    launch.sh
    
    ```
    
    if [ "$m" = DP-3 ]; then
                 ^
                 |
                 Change this
    ```
    
