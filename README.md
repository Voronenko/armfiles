

## Locales

For a naked system you might need to switch to utf locale manually

```sh
apt-get install -y locales
locale-gen en_US.UTF-8
localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
```
