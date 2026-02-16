# Nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

export NIX_SHELL_PRESERVE_PROMPT=1
if [[ -n "$IN_NIX_SHELL" ]]; then
  export PS1="$PS1(nix-shell) "
fi

# Oh My ZSH
# Install Script:
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# =========================================================== [Source Environment Variables] ===== #
[[ ! -f ~/env.z.sh ]] && return 0
source ~/env.z.sh

# ==================================================================== [Shell Configuration] ===== #
export SHELL=/bin/zsh
HISTFILESIZE=100000
HISTSIZE=10000

# ========================================================= [Automate Install/Configuration] ===== #
INSTALL_STATE="$HOME/.install-state"
[[ -d "$INSTALL_STATE" ]] || mkdir -p "$INSTALL_STATE"
setup() {
  local module_dir="$1"
  local state_file="$INSTALL_STATE/${${module_dir#$HOME/.files/}//\//.}"

  if [[ ! -f "$state_file" ]]; then
    if [[ -f "$module_dir/install.z.sh" ]]; then
      if source "$module_dir/install.z.sh"; then
        touch "$state_file"
        cd ~
        git checkout .
        git clean -fd
      else
        echo "❌ Install failed for $module_dir"
        return 1
      fi
    else
      touch "$state_file"
    fi
  fi

  [[ -f "$module_dir/config.z.sh" ]] && source "$module_dir/config.z.sh"
}

# =============================================================== [Source Modules/Languages] ===== #
for folder in modules languages; do
  base=~/.files/$folder
  [[ -d $base ]] || continue

  for dir in $base/*(/); do
    setup "$dir"
  done
done

