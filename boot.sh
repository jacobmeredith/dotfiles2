pacman -Q git &>/dev/null || sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning dotfiles2..."
rm -rf ~/.local/share/dotfiles2/
git clone https://github.com/jacobmeredith/dotfiles2.git ~/.local/share/dotfiles2 >/dev/null

# Use custom branch if instructed
if [[ -n "$DOTFILES2_REF" ]]; then
  echo -e "\eUsing branch: $DOTFILES2_REF"
  cd ~/.local/share/dotfiles2
  git fetch origin "${DOTFILES2_REF}" && git checkout "${DOTFILES2_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/dotfiles2/install.sh
