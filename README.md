# Nvim
My customizaton


## List of programs you should install:
* NeoVim
* [Lf](https://github.com/gokcehan/lf)
* [Tmux](https://github.com/tmux/tmux/wiki)
* Python3, pip & Node Support
* [Xsel](https://github.com/kfish/xsel)
* [fzf](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [universal-ctags](https://github.com/universal-ctags/ctags)
* [silversearcher-ag](https://github.com/ggreer/the_silver_searcher)
* [fd-find](https://github.com/sharkdp/fd)


## Tmux working with Nvim
It's neccesary to create `.tmux.conf` file in `/home/(name)`. 
Add the following to your `~/.tmux.conf` file:

```
# set 256 color
set -g default-terminal "screen-256color"

# Start numbering at 1
set -g base-index 1

# Set status bar
set -g status-fg white
set -g status-bg black

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

bind-key -T copy-mode-vi 'C-l' select-pane -L
bind-key -T copy-mode-vi 'C-j' select-pane -D
bind-key -T copy-mode-vi 'C-k' select-pane -U
bind-key -T copy-mode-vi 'C-h' select-pane -R
bind-key -T copy-mode-vi 'C-\' select-pane -l

```

## Icons
Create `NerdFonts` directory in `~/.local/share/fonts`.
Go to the [Patched Fonts](https://github.com/ryanoasis/nerd-fonts), choose your font, download and install into your new directory.
