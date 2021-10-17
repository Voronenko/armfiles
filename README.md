

## Locales

For a naked system you might need to switch to utf locale manually

```sh
apt-get install -y locales
locale-gen en_US.UTF-8
localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
```

## Mimic docker behavior with podman

```sh
sudo systemctl enable --now podman.socket
```

```sh
sudo systemctl start podman.socket
```

To enable the link to var/lib/docker.sock using the docker-podman package:

```sh
sudo apt install podman-docker
```

Validate

```sh
sudo curl -H "Content-Type: application/json" --unix-socket /var/run/docker.sock http://localhost/_ping
OK
```

However, if podman-docker is not present on your distribution - install podman-compose, and start using podman binary.


Don't forget to specify registries to search

The registries.conf configuration is in play whenever we push or pull an image. Or, more generally speaking, whenever we contact a container registry. 
That's an easy rule of thumb. The systemwide location is /etc/containers/registries.conf, but if you want to change that for a single user, 
you can create a new file at $HOME/.config/containers/registries.conf.

```
[registries.search] 
registries = ['docker.io', 'registry.fedoraproject.org', 'quay.io', 'registry.access.redhat.com', 'registry.centos.org']
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

Q: Using podman instead of docker I am getting error "The cgroupv2 manager is set to systemd but there is no systemd user session available"
A:
   edit /etc/containers/containers.conf, ensure following contents:

```
[engine]
cgroup_manager = "cgroupfs"
events_logger = "file"
```



