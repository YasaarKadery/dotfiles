export PATH="$HOME/.local/bin:$PATH"

# Initialize Homebrew if present (Apple Silicon, Intel Mac, or Linuxbrew)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Enable native terminal colors
export CLICOLOR=1

# Colored zsh tab-completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Starship prompt (Gruvbox Rainbow)
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# Colorful ls replacements via eza
if command -v eza >/dev/null 2>&1; then
  alias ls="eza --icons --group-directories-first"
  alias ll="eza -la --icons --git --group-directories-first"
  alias lt="eza --tree --level=2 --icons"
fi

# Syntax-highlighted cat & man pages via bat
if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# fzf keybindings + Gruvbox Dark colors
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
  export FZF_DEFAULT_OPTS=" \
    --color=bg+:#3c3836,bg:#1d2021,spinner:#fb4934,hl:#928374 \
    --color=fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934 \
    --color=marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934"
fi

# Machine-specific overrides (not tracked in git)
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

# Inline history suggestions & live command syntax highlighting (keep highlighting last)
_BREW_PREFIX=""
if command -v brew >/dev/null 2>&1; then
  _BREW_PREFIX="$(brew --prefix)"
fi

for _autosuggest in \
  "$_BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"; do
  if [[ -f "$_autosuggest" ]]; then
    source "$_autosuggest"
    break
  fi
done

for _highlight in \
  "$_BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
  "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"; do
  if [[ -f "$_highlight" ]]; then
    source "$_highlight"
    break
  fi
done
unset _BREW_PREFIX _autosuggest _highlight
