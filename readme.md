# My .files

Master branch is deprecated, just for documentation.

Switch to [`linux`](https://github.com/voldedore/dotfiles/tree/linux) or [`macos`](https://github.com/voldedore/dotfiles/tree/macos) branch for appropriate configuration.

## How to config:

See this article: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

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

