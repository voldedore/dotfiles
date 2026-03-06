# My .files

Master branch is deprecated, just for documentation.

This readme is for this branch **ONLY**.

## How to backup and restore

Presume you did git clone and had everything in

    ~/dotfiles

Also, you `alias`ed the `config` command.

Then checkout and create a local branch

    ## If you already have a zshrc, move them first
    mv ~/.zshrc ~/.zshrc_bk
    config switch fedora-202603

After this, you can use 

    config status
    config add
    config commit

just like git command

To restore `.zshrc`, in `~`:

    config checkout .zshrc

## Configuration used in this branch

As of 2026 March, I switched to Fedora 43 GNOME + Niri. vim is also replaced by neovim. The custom theme of OMZ also removed and the default theme is used.
