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

## Icons
Create `NerdFonts` directory in `~/.local/share/fonts`.
Go to the [Patched Fonts](https://github.com/ryanoasis/nerd-fonts), choose your font, download and install into your new directory.

## Tmux working with Nvim
It's neccesary to create `.tmux.conf` file in `/home/(name)`. 
Add the following [config_code](https://github.com/frankorc/my_dotfiles/blob/main/.tmux.conf) to your `~/.tmux.conf` file.

## Credits
I've used some configurations from [nvim](https://github.com/ChristianChiarulli/nvim)


## FROM HERE IT'S OPTIONAL

## Startify
You could add a custom header in `start-screen.vim`. You can find it in `~/.config/nvim/plug-config`.
You could use web pages to convert Text to ASCII online and put it at the beginning of the file like this:
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

## Bclose
Edit the file `bclose.vim` when all have been installed. You can find it in `~/.config/nvim/autoload/plugged/bclose.vim`.

Change the letter `d` instead of `bd` in `nnoremap <silent> <Leader>bd :Bclose<CR>`
```
if exists ("g:bclose_no_plugin_maps") &&  g:bclose_no_plugin_maps
    "do nothing
elseif exists ("g:no_plugin_maps") &&  g:no_plugin_maps
    "do nothing
else
     nnoremap <silent> <Leader>d :Bclose<CR>
endif
```

## GitMessenger
Edit the file `gitmessenger.vim` when all have been installed. You can find it in `~/.config/nvim/autoload/plugged/git-messenger.vim`.
Comment all of this:
```
" if !g:git_messenger_no_default_mappings
"     nmap <Leader>gm <Plug>(git-messenger)
" endif
```

