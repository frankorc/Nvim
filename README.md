# Nvim
Neovim is a fork of the Vim code. Brings the best of [Vim](https://www.vim.org/) with a better experience that can work from the terminal.
It has a high customization capacity and everything can be controlled with the keyboard using commands.

So, here is my customization:

<img src="https://github.com/frankorc/nvim/blob/main/Images/2020-10-13_12-53.png" />

## List of programs you should install:
* [NeoVim](https://neovim.io/)
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

# Set the base index for windows to 1 instead of 0
set -g base-index 1

# Set the base index for panes to 1 instead of 0
set -g pane-base-index 1

# re-number windows when one is closed
set -g renumber-windows on

# Set status bar
set -g status-position bottom
set -g status-justify left
set -g status-style 'bg=colour235 fg=colour120 dim'
set -g status-left ''
set -g status-right '#[fg=colour0,bg=colour114] %H:%M %d-%b-%y '

setw -g window-status-current-style 'fg=colour235 bg=colour120 bold'
setw -g window-status-current-format ' #I#[fg=colour235]:#[fg=colour235]#W#[fg=colour235] '

setw -g window-status-style 'fg=colour120 bg=colour235'
setw -g window-status-format ' #I#[fg=colour120]:#[fg=colour120]#W#[fg=colour120] '

setw -g window-status-bell-style 'fg=colour255 bg=colour1 bold'

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


## Startify
You cand add a custom header in `start-screen.vim`. You can find it in `~/.config/nvim/plug-config`.
You can use pages to convert Text to ASCII online and put it at the beginning of the file like this:

```
let g:startify_custom_header = [
        \'  _   _ ______ ______      _______ __  __  ',
        \' | \ | |  ____/ __ \ \    / /_   _|  \/  | ',
        \' |  \| | |__ | |  | \ \  / /  | | | \  / | ', 
        \' | . ` |  __|| |  | |\ \/ /   | | | |\/| | ',
        \' | |\  | |___| |__| | \  /   _| |_| |  | | ',
        \' |_| \_|______\____/   \/   |_____|_|  |_| ',
        \]
```
                                      
                                      
## Lf
Edit the file `lf.vim` when all have been installed. You can find it in `~/.config/nvim/autoload/plugged/lf.vim`.

Comment all of this:
```
" " To open lf when vim load a directory
" if exists('g:lf_replace_netrw') && g:lf_replace_netrw
"   augroup ReplaceNetrwByLfVim
"     autocmd VimEnter * silent! autocmd! FileExplorer
"     autocmd BufEnter * if isdirectory(expand("%")) | call OpenLfOnVimLoadDir("%") | endif
"   augroup END
" endif

" if !exists('g:lf_map_keys') || g:lf_map_keys
"   map <leader>f :Lf<CR>
" endif
```

If the file `lfrc` does not exist. You can create it in `~/.config/lf` and put the next piece of code. 
```
set shell zsh #or bash if you are not using zsh
set shellopts '-eu:--shwordsplit'
set ifs "\n"
set scrolloff 10

cmd open ${{
    case $(file --mime-type $f -b) in
        text/*) $EDITOR $fx;;
        *) for f in $fx; do setsid $OPENER $f > /dev/null 2> /dev/null & done;;
    esac
}}
```

## Bclose
Edit the file `bclose.vim` when all have been installed. You can find it in `~/.config/nvim/autoload/plugged/bclose.vim`.

Change the letter `d` instead of `bd` in `nnoremap <silent> <Leader>d :Bclose<CR>`
```
if exists ("g:bclose_no_plugin_maps") &&  g:bclose_no_plugin_maps
    "do nothing
elseif exists ("g:no_plugin_maps") &&  g:no_plugin_maps
    "do nothing
else
     nnoremap <silent> <Leader>d :Bclose<CR>
endif
```

## Credits
I've used some configurations from [nvim](https://github.com/ChristianChiarulli/nvim)
