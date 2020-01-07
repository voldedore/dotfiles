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
