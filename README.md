# SteamOS (Distro)
This is my personal configuration for SteamOS. Feel free to use it or fork it.

## Sync the repository
To start you must first sync the home directory. Run the command below to do so.
```sh
curl -fsSL https://raw.githubusercontent.com/BosEriko/steam/HEAD/install.sh | sh
```

## Make ZSH Default
To make ZSH the default shell just run the command below to.
```sh
chsh -s $(which zsh)
```