HISTFILESIZE=100000
HISTSIZE=10000

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

export NIX_SHELL_PRESERVE_PROMPT=1
if [[ -n "$IN_NIX_SHELL" ]]; then
  export PS1="$PS1(nix-shell) "
fi
