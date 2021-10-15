

## Locales

For a naked system you might need to switch to utf locale manually

```sh
apt-get install -y locales
locale-gen en_US.UTF-8
localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
```


## Troubleshouting

Q: I see "left_prompt_segment:XX: command not found: print_icon"  error message
A: Try following

```sh
source "${HOME}/dotfiles/helpers/icons.zsh"
(anon):107: character not in range
```

That "character not in range" error occurs when zsh's print or echo encounters an escape sequence that's not valid for the encoding it's currently using. 
You can cause it by setting your LC_CTYPE to a non-UTF-8 locale.

```sh
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales
```
