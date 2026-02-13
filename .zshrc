# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s histappend
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

if [[ ! -v BASH_COMPLETION_VERSINFO ]]; then
  . "/nix/store/qnphl1r89mgphaaswzpxdqs96bwpsvx7-bash-completion-2.17.0/etc/profile.d/bash_completion.sh"
fi

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

export NIX_SHELL_PRESERVE_PROMPT=1
if [[ -n "$IN_NIX_SHELL" ]]; then
  export PS1="$PS1(nix-shell) "
fi
