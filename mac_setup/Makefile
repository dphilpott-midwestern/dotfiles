TARGET_USER := username
MACHINE_NAME := machinename

# Needs admin su
1: brew
2: apps setup_python
# Get out of admin su to normal user
3: zsh
4: fonts zsh-addons chezmoi mac_defaults git_dir restart_dock manual_steps pycharm firefox sublime_merge sublime_text
5: sublime_text_package_control sublime_text_packages setup_git

brew:
	mkdir -p ~/temp
	sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh > ~/temp/Homebrew_install.sh
	chmod 777 ~/temp/Homebrew_install.sh
	NONINTERACTIVE=1 /bin/bash -c ~/temp/Homebrew_install.sh
	echo 'eval "$$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
	echo 'eval "$$(/opt/homebrew/bin/brew shellenv)"' >> /Users/${TARGET_USER}/.zprofile
	rm -r ~/temp
	echo '!!! Run the following commands'
	eval "$$(/opt/homebrew/bin/brew shellenv)"
	export PATH=/opt/homebrew/bin:$$PATH

apps:
	sudo -v
	brew install git
	brew install --cask slack
	brew install docker
	brew install python@3.11
	brew install pyenv
	sudo softwareupdate --install-rosetta
	brew install --cask snowflake-snowsql
	brew install awscli
	brew install --cask hammerspoon
	brew install --cask caffeine
	brew install terraform
	brew install terragrunt
	brew install --cask sublime-text
	brew install --cask sublime-merge
	brew install --cask pycharm
	brew install --cask postman
	brew install --cask firefox
	brew install --cask iterm2
	brew install --cask meld
	brew install --cask barrier
	brew install thefuck
	brew install ferdium
	brew install --cask hiddenbar
	brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
	brew tap homebrew/cask-fonts && brew install --cask font-dejavu-sans-mono-nerd-font
	brew install --cask karabiner-elements
	brew install chezmoi
	brew install linearmouse
	brew install flameshot
	brew install --cask microsoft-teams
	brew install --cask eqmac

setup_python:
	python3 -m pip install --user --upgrade setuptools
	python3 -m pip install --user --upgrade pip

zsh:	
	sh -c "$$(curl -fsSL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh)" && chsh -s /bin/zsh $(TARGET_USER)

zsh-addon:
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /Users/${TARGET_USER}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions /Users/${TARGET_USER}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	gem install colorls
	export ZSH="/Users/${TARGET_USER}/.oh-my-zsh"
	git clone https://github.com/romkatv/powerlevel10k.git $$ZSH/themes/powerlevel10k
	zsh

fonts:
	curl -L --output 'MesloLGS NF Regular.ttf' 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
	curl -L --output 'MesloLGS NF Bold.ttf' 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf'
	curl -L --output 'MesloLGS NF Italic.ttf' 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf'
	curl -L --output 'MesloLGS NF Bold Italic.ttf' 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf' 
	mv ./MesloLGS\ NF\ Regular.ttf ~/Library/Fonts/MesloLGS\ NF\ Regular.ttf
	mv ./MesloLGS\ NF\ Bold.ttf ~/Library/Fonts/MesloLGS\ NF\ Bold.ttf
	mv ./MesloLGS\ NF\ Italic.ttf ~/Library/Fonts/MesloLGS\ NF\ Italic.ttf
	mv ./MesloLGS\ NF\ Bold\ Italic.ttf ~/Library/Fonts/MesloLGS\ NF\ Bold\ Italic.ttf

chezmoi:
	chezmoi init --apply https://github.com/dphilpott-midwestern/dotfiles.git

mac_defaults_nosudo:
	# Dock settings
	defaults write com.apple.dock "orientation" -string "bottom"
	defaults write com.apple.dock "tilesize" -int "41"
	defaults write com.apple.dock "largesize" -int "62"
	defaults write com.apple.dock "autohide" -bool "false"
	defaults write com.apple.dock "show-recents" -bool "false"
	defaults write com.apple.dock "mineffect" -string "scale"
	defaults write com.apple.dock "mouse-over-hilite-stack" -bool true
	defaults write com.apple.dock "minimize-to-application" -bool true
	defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool true
	defaults write com.apple.dock "expose-group-by-app" -bool false
	defaults write com.apple.dock "autohide-delay" -float 0
	defaults write com.apple.dock "autohide-time-modifier" -float 0

	# Finder
	defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
	defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
	defaults write com.apple.finder "ShowPathbar" -bool "true"
	defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
	defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
	defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0"
	defaults write com.apple.Finder AppleShowAllFiles true

	# Disable the over-the-top focus ring animation
	defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

	# Expand save panel by default
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

	# Expand print panel by default
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

	# Save to disk (not to iCloud) by default
	defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

	# Disable autocorrect
	defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

mac_defaults:
	osascript -e 'tell application "System Preferences" to quit'
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

	# Dock settings
	defaults write com.apple.dock "orientation" -string "bottom"
	defaults write com.apple.dock "tilesize" -int "41"
	defaults write com.apple.dock "largesize" -int "62"
	defaults write com.apple.dock "autohide" -bool "false"
	defaults write com.apple.dock "show-recents" -bool "false"
	defaults write com.apple.dock "mineffect" -string "scale"
	defaults write com.apple.dock "mouse-over-hilite-stack" -bool true
	defaults write com.apple.dock "minimize-to-application" -bool true
	defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool true
	defaults write com.apple.dock "expose-group-by-app" -bool false
	defaults write com.apple.dock "autohide-delay" -float 0
	defaults write com.apple.dock "autohide-time-modifier" -float 0

	# Finder
	defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
	defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
	defaults write com.apple.finder "ShowPathbar" -bool "true"
	defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
	defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
	defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0"
	defaults write com.apple.Finder AppleShowAllFiles true

	# Disable the sound effects on boot
	sudo nvram SystemAudioVolume=" "

	# Disable the over-the-top focus ring animation
	defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

	# Expand save panel by default
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

	# Expand print panel by default
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
	defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

	# Save to disk (not to iCloud) by default
	defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

	# Disable autocorrect
	defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

git_dir:
	mkdir -p ~/git

restart_dock:
	defaults read /Users/${TARGET_USER}/Library/Preferences/com.apple.dock.plist
	killall Dock

manual_steps:
	echo "!!! Add the following apps to login items:"
	echo "Barrier.app, Caffeine.app, Ferdium.app, Hammerspoon.app, iTerm.app"
	echo "!!! Open the following apps:"
	echo "Barrier, Caffeine, Ferdium, Hammerspoon, iTerm, HiddenBar, Karabiner-elements, Karabiner-eventviewer"

pycharm:
	echo "!!! Start PyCharm"
	echo "!!! Login to PyCharm account"
	echo "!!! Pull config via Settings Sync"

sublime_merge:
	echo "!!! Start Sublime Merge"
	echo "!!! Set license from password handler"
	echo "!!! Set dark theme"

sublime_text:
	echo "!!! Start Sublime Text"
	echo "!!! Set license from password handler"

sublime_text_package_control:
	subl -b --command "install_package_control"

sublime_text_packages:
	subl -b --command "advanced_install_package {\"packages\": \"A File Icon,AdvancedNewFile,BracketHighlighter,Dockerfile Syntax Highlighting,GitGutter,LaTeXTools,Material Theme,SideBarEnhancements,sublimelint,SublimeLinter,Terraform,Theme - Cobalt2\"}"

setup_git:
	mkdir -p ~/.ssh
	ssh-keygen -t rsa -f ~/.ssh/id_rsa_github_$(MACHINE_NAME) -P ""
	touch ~/.ssh/config
	echo "Host github.com\n    HostName github.com\n    User git\n    IdentityFile ~/.ssh/id_rsa_github_$(MACHINE_NAME)" >> ~/.ssh/config
	echo "!!! Add the ssh key to github"
	echo "!!! Test with the following:"
	echo "ssh -T git@github.com"

firefox:
	echo "!!! Do the following"
	echo "Open firefox and navigate to about:profiles"
	echo "Make the default profile the default profile, and rename to customer"
	echo "Set the bookmark bar to always appear and bookmark the about:profiles page as the profile name"
	echo "Set up HTTPS only, no telemetry, no password saving"
	echo "Add the following addons: languagetool, bitwarden, ublock, AWS Extend Switch Roles"
	echo "Login to Bitwarden and languagetool (and accept the languagetool T&Cs)"
	echo "Add a unique theme"
	echo "Rearrange the toolbar to remove unneeded items, and pin bitwarden, languagetool, AWS Extend Switch Roles"
	echo "Make firefox the default web browser"
