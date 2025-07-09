# Copy over Omarchy configs
cp -R ~/.local/share/dotfiles2/config/* ~/.config/

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# Use default bashrc from Omarchy
echo "source ~/.local/share/dotfiles2/default/bash/rc" >~/.bashrc

# Login directly as user, rely on disk encryption + hyprlock for security
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo tee /etc/systemd/system/getty@tty1.service.d/override.conf >/dev/null <<EOF
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $USER --noclear %I \$TERM
EOF

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true
git config --global init.defaultBranch master

# Set identification from install inputs
if [[ -n "${DOTFILES2_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$DOTFILES2_USER_NAME"
fi

if [[ -n "${DOTFILES2_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$DOTFILES2_USER_EMAIL"
fi

# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/dotfiles2/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$DOTFILES2_USER_NAME"
<Multi_key> <space> <e> : "$DOTFILES2_USER_EMAIL"
EOF
