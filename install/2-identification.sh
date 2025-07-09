# Need gum to query for input
yay -S --noconfirm --needed gum

# Configure identification
echo -e "\nEnter identification for git and autocomplete..."
export DOTFILES2_USER_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export DOTFILES2_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")
