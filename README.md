# dotfiles

Cross-platform Gruvbox Dark terminal and shell configuration for **macOS** and **Linux / WSL2**.

## What's Included
- **Ghostty** (`ghostty/.config/ghostty/config`) — Gruvbox Dark Hard, `JetBrainsMono Nerd Font`, frosted glass, crisp typography
- **Zsh** (`zsh/.zshrc`) — Starship prompt, `eza`, `bat`, `fzf` (Gruvbox Dark), `zsh-autosuggestions`, `zsh-syntax-highlighting`, colored tab completion
- **Starship** (`starship/.config/starship.toml`) — Gruvbox Rainbow prompt preset
- **Git** (`git/.gitconfig`) — `delta` pager with Gruvbox Dark syntax highlighting + line numbers
- **Bat** (`bat/.config/bat/config`) — `gruvbox-dark` theme
- **Windows Terminal** (`windows-terminal/gruvbox.json`) — Matching Gruvbox Dark Hard scheme + Acrylic blur snippet for WSL2
- **Brewfile** — Installs all CLI tools on macOS & Linux/WSL2 (plus Ghostty & Nerd Font on macOS)

## Quick Setup (macOS & Linux / WSL2)

```bash
git clone https://github.com/YasaarKadery/dotfiles.git ~/dev/dotfiles
cd ~/dev/dotfiles
brew bundle
./install.sh
```

Then open a new terminal tab (or run `source ~/.zshrc`).

### Machine-Specific Overrides
Keep private or machine-specific settings out of git using:
- `~/.zshrc.local` — sourced automatically at the end of `.zshrc`
- `~/.gitconfig.local` — included automatically by `.gitconfig` (great for `user.name` / `user.email`)

### Windows + WSL2 Notes
1. Install **JetBrainsMono Nerd Font** on Windows.
2. Merge `windows-terminal/gruvbox.json` into your Windows Terminal `settings.json`.
3. Run the Quick Setup commands above inside your WSL2 Linux distro.
