# Install brew if not already installed
brew help &> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install wget
brew install wget

# Download all the scripts
if [ ! -d ~/scripts ]
then
	mkdir ~/scripts
fi
cd ~/scripts
pwd

wget https://raw.githubusercontent.com/srares76/scripts-repo/master/install-brew.sh
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/+compile
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/ccompile
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/getbattery
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/brght
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/upgrade-utilities.sh
sudo chmod a+x * 

# Move them in bin
for each in $(ls ~/scripts)
do
	if [ ! -f /usr/local/bin/"$each" ]
	then
		cp "$each" /usr/local/bin/
	fi
done

clear

# Possibly install Sublime
echo "Do you want Sublime-Text?"
read ANS
if [ "$ANS" = "yes" ] || [ "$ANS" = "Yes" ] || [ "$ANS" = "y" ] || [ "$ANS" = "Y" ]
then
	brew install sublime-text
fi

# Possibly install Visual Studio Code
echo "Do you want Visual Studio Code?"
read ANS
if [ "$ANS" = "yes" ] || [ "$ANS" = "Yes" ] || [ "$ANS" = "y" ] || [ "$ANS" = "Y" ]
then
	brew install visual-studio-code

	# Installation of my most used VSCode extensions
	code --install-extension apommel.matlab-interactive-terminal
	code --install-extension bramvanbilsen.matlab-code-run
	code --install-extension CoenraadS.bracket-pair-colorizer-2
	code --install-extension Gimly81.matlab
	code --install-extension kiteco.kite
	code --install-extension ms-vscode.cpptools
	code --install-extension paulosilva.vsc-octave-debugger
	code --install-extension thanhtrang.theme-flatland-monokai
	code --install-extension toasty-technologies.octave
fi

# Possibly install Discord
echo "Do you want Discord?"
read ANS
if [ "$ANS" = "yes" ] || [ "$ANS" = "Yes" ] || [ "$ANS" = "y" ] || [ "$ANS" = "Y" ]
then
	brew install Discord
fi

# Possibly install Google Chrome
echo "Do you want Google Chrome?"
read ANS
if [ "$ANS" = "yes" ] || [ "$ANS" = "Yes" ] || [ "$ANS" = "y" ] || [ "$ANS" = "Y" ]
then
	brew install google-chrome
fi

# Possibly intall Octave
echo "Do you want Octave for terminal?"
read ANS
if [ "$ANS" = "yes" ] || [ "$ANS" = "Yes" ] || [ "$ANS" = "y" ] || [ "$ANS" = "Y" ]
then
	brew install octave
fi

# Install essentials
echo "Installing essentials..."
sleep 2
brew install whatsapp
brew install iterm2
brew install alfred
brew install spectacle
brew install macs-fan-control

# Install other packages
clear
echo "Do you ever use the terminal?"
read ANS
if [ "$ANS" = "yes" ] || [ "$ANS" = "Yes" ] || [ "$ANS" = "y" ] || [ "$ANS" = "Y" ]
then
	echo "Installing other useful packages..."
	brew install tree
	brew install pstree
	brew install pidof
	brew install tldr
	brew install htop
	brew install speedtest-cli
	brew install python@3.9
	brew install perl
	brew install brightness
fi

# Clean up
rm -r ~/scripts

echo =========================================================
echo
echo Done! Everything was installed!