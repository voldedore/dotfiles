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

We have 2 separated locations:

- Current directory which consists of the git managed directory. In this directory, we only touch notes file, like this readme.md that you are currently reading.
- The `$HOME` directory. This should have the actual configuration of anything you want to persist.

### Examples

To restore `.zshrc`, in `~`:

    config checkout .zshrc

To backup

```zsh

# In anywhere

➜  ~ config add ~/.config/niri/config.kdl
➜  ~ config status
On branch fedora-202603
Your branch is up to date with 'origin/fedora-202603'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   .config/niri/config.kdl

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	deleted:    readme.md

Untracked files not listed (use -u option to show untracked files)
```

- That `config status` will add `.config/niri/config.kdl` to the staged. 
- The `readme.md` file is marked deleted but not staged yet. Because the `--work-tree` is `$HOME` but in `$HOME`, there is no file `readme.md`, so it's marked as deleted.

```zsh
# In this repo location

➜  ~ cd ~/dotfiles
➜  dotfiles git:(fedora-202603) ✗ git status
On branch fedora-202603
Your branch is up to date with 'origin/fedora-202603'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   .config/niri/config.kdl

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	deleted:    .config/niri/config.kdl
	deleted:    .gnupg/gpg-agent.conf
	deleted:    .gnupg/gpg.conf
	deleted:    .zshrc

Untracked files not listed (use -u option to show untracked files)
```

- The new file is marked as new and staged.
- The `readme.md` file didn't appear in that output because we did use `git` command and the `--work-dir` is the current directory.
- The `.config/niri/config.kdl` file is also marked as deleled because that file doesn't exist in the current directory.

After this, you can `commit` and `push` as usual.


## Configuration used in this branch

As of 2026 March, I switched to Fedora 43 GNOME + Niri. 

vim is also replaced by neovim. 

The custom theme of OMZ also removed and the default theme is used.
