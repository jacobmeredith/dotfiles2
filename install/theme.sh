# Use dark mode for QT apps too (like kdenlive)
sudo pacman -S --noconfirm kvantum-qt5

# Prefer dark mode everything
sudo pacman -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Setup theme links
mkdir -p ~/.config/dotfiles2/themes
for f in ~/.local/share/dotfiles2/themes/*; do ln -s "$f" ~/.config/dotfiles2/themes/; done

# Set initial theme
mkdir -p ~/.config/dotfiles2/current
ln -snf ~/.config/dotfiles2/themes/tokyo-night ~/.config/dotfiles2/current/theme
source ~/.local/share/dotfiles2/themes/tokyo-night/backgrounds.sh
ln -snf ~/.config/dotfiles2/backgrounds/tokyo-night ~/.config/dotfiles2/current/backgrounds
ln -snf ~/.config/dotfiles2/current/backgrounds/1-Pawel-Czerwinski-Abstract-Purple-Blue.jpg ~/.config/dotfiles2/current/background

# Set specific app links for current theme
ln -snf ~/.config/dotfiles2/current/theme/hyprlock.conf ~/.config/hypr/hyprlock.conf
ln -snf ~/.config/dotfiles2/current/theme/wofi.css ~/.config/wofi/style.css
ln -snf ~/.config/dotfiles2/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/dotfiles2/current/theme/btop.theme ~/.config/btop/themes/current.theme
mkdir -p ~/.config/mako
ln -snf ~/.config/dotfiles2/current/theme/mako.ini ~/.config/mako/config
