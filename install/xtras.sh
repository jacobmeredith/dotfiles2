yay -S --noconfirm --needed \
  obsidian-bin typora libreoffice obs-studio kdenlive \
  pinta xournalpp

# Copy over Omarchy applications
source ~/.local/share/dotfiles2/bin/omarchy-sync-applications || true
