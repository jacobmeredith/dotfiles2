BACKGROUNDS_DIR=~/.config/dotfiles2/backgrounds/

download_background_image() {
  local url="$1"
  local path="$2"
  gum spin --title "Downloading $url as $path..." -- curl -sL -o "$BACKGROUNDS_DIR/$path" "$url"
}

for t in ~/.local/share/dotfiles2/themes/*; do source "$t/backgrounds.sh"; done
