#!/bin/zsh

# ===== POWERLEVEL10K INSTANT PROMPT =====
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ===== ZINIT CONFIGURATION =====
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi


source "${ZINIT_HOME}/zinit.zsh"

# ===== THEME =====
zinit ice depth=1; zinit light romkatv/powerlevel10k

# ===== COMPLETION CONFIG =====
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


# ===== ESSENTIAL PLUGINS =====
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# ===== SNIPPETS (Reemplazan plugins de OMZ) =====
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# ===== PATH CONFIGURATION =====
export PATH="$HOME/.local/bin:$HOME/.opencode/bin:$HOME/.cargo/bin:$HOME/.volta/bin:$HOME/.bun/bin:$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:$HOME/.config:$HOME/.cargo/bin:/usr/local/lib/*:$PATH"

# ===== ARCH LINUX SPECIFIC =====
export LS_COLORS="di=38;5;67:ow=48;5;60:ex=38;5;132:ln=38;5;144:*.tar=38;5;180:*.zip=38;5;180:*.jpg=38;5;175:*.png=38;5;175:*.mp3=38;5;175:*.wav=38;5;175:*.txt=38;5;223:*.sh=38;5;132"

# ===== ALIASES =====
alias ls='eza --icons=auto --group-directories-first --color=always'
alias ll='eza -lh --icons=auto --group-directories-first --color=always'
alias la='eza -lah --icons=auto --group-directories-first --color=always'
alias lt='eza -T --icons=auto --color=always'
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=gruvbox-dark --color=always {}")'

# ===== SHELL INTEGRATIONS =====
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)


# ===== POWERLEVEL10K FINAL =====
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
