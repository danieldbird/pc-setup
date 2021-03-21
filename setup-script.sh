#!/usr/bin/env zsh
echo '
\033[38;5;198m
  ___ ___ _____ _   _ ___   _  _ _____      __  ___  ___ 
 / __| __|_   _| | | | _ \ | \| | __\ \    / / | _ \/ __|
 \__ \ _|  | | | |_| |  _/ | .` | _| \ \/\/ /  |  _/ (__ 
 |___/___| |_|  \___/|_|   |_|\_|___| \_/\_/   |_|  \___|
\033[0m
\033[38;5;117mStep 1: Update macOS\033[0m\n
\033[38;5;114mPress Enter to continue..\033[0m'
rm -f ~/.zshrc
read -p ''

softwareupdate -i -a --verbose

#############################

echo '
\033[38;5;117mStep 2: Change key repeat behaviour when a key is held\033[0m\n
\033[38;5;114mPress Enter to continue..\033[0m'
read -p ''

defaults write -g ApplePressAndHoldEnabled -bool false

#############################

echo '
\033[38;5;117mStep 3: Install Homebrew\033[0m\n
\033[38;5;114mPress Enter to continue..\033[0m'
read -p ''

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/danieldbird/.zshrc
source ~/.zshrc

#############################

echo '
\033[38;5;117mStep 4: Install Apps\033[0m\n
\033[38;5;114mPress Enter to continue..\033[0m'
read -p ''

brew install cask alfred
brew install cask appcleaner
brew install cask expressvpn
brew install cask google-backup-and-sync
brew install cask google-chrome
brew install cask iterm2
brew install cask itsycal
brew install cask openvpn-connect
brew install cask radio-silence
brew install cask rectangle
brew install cask visual-studio-code

echo '
\033[38;5;227mSetup Itsycal with this date format:\n"EEEE d MMMM YYYY"\n
Setup Google Backup and Sync while nvm is installing,\n and wait for .zshrc to sync.\033[0m'

#############################


echo '
\033[38;5;117mStep 5: Install nvm\033[0m\n
\033[38;5;114mPress Enter to continue..\033[0m'
read -p ''

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source ~/.zshrc

#############################

echo '
\033[38;5;117mStep 6: Install node\033[0m\n
\033[38;5;114mPress Enter to continue..\033[0m'
read -p ''
nvm install --lts

echo '
\033[38;5;117mStep 7: Install Spaceship prompt\033[0m\n
\033[38;5;114mPress Enter to continue..\033[0m'
read -p ''
npm install -g spaceship-prompt

echo '
\033[38;5;117mStep 8: Symlink .zshrc\033[0m\n
\033[38;5;227mMake sure Google Backup and Sync is setup and synced,
then Press Enter to continue..\033[0m'
read -p ''

rm -f ~/.zshrc
ln -s '/Users/danieldbird/Google Drive/Personal/PC/Preferences/zsh/.zshrc' '/Users/danieldbird/';
echo '\033[38;5;114mDone, please run ". ~/.zshrc".\n
Consider installing manually:
Adobe Illustrator
Adobe Photoshop
Microsoft Remote Desktop <-- App store
Sketch
Sketchup
Todoist <-- App store

Add dock spaces with:'
echo "defaults write com.apple.dock persistent-apps -array-add '{\"tile-type\"=\"spacer-tile\";}'; killall Dock\n"
echo "defaults write com.apple.dock persistent-apps -array-add '{\"tile-type\"=\"spacer-tile\";}'; killall Dock" | pbcopy
echo "Copied to your clipboard.\033[0m"