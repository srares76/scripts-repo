# Download all the scripts

if [ ! -d ~/scripts ]
then
	mkdir ~/scripts
fi
cd ~/scripts
pwd

wget https://raw.githubusercontent.com/srares76/scripts-repo/master/install-brew.sh
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/subl
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/+compile
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/ccompile
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/getbattery
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/brght
sudo chmod a+x * 


# Move them in bin

for each in $(ls ~/scripts)
do
	if [ ! -f /usr/local/bin/"$each" ]
	then
		cp "$each" /usr/local/bin/
	fi
done


# Install brew
brew help &> /dev/null || ./install-brew.sh


clear
# Possibly install Sublime
echo "Do you want Sublime-Text?"
read ANS
if [ "$ANS" = "yes" ] || [ "$ANS" = "Yes" ] || [ "$ANS" = "y" ] || [ "$ANS" = "Y" ]
then
	brew install sublime-text
fi


# Possibly install Discord

echo "Do you want Discord?"
read ANS
if [ "$ANS" = "yes" ] || [ "$ANS" = "Yes" ] || [ "$ANS" = "y" ] || [ "$ANS" = "Y" ]
then
	brew install Discord
fi

echo "Do you want Google Chrome?"
read ANS
if [ "$ANS" = "yes" ] || [ "$ANS" = "Yes" ] || [ "$ANS" = "y" ] || [ "$ANS" = "Y" ]
then
	brew install google-chrome
fi


# Install essentials

echo "Installing essentials..."
sleep 2
brew install whatsapp
brew install surfshark
brew install alfred
brew install spectacle
brew install macs-fan-control
brew install keyboard-maestro
open /Applications/zoom.us.app &> /dev/null && brew install zoom


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


# Personalize zsh if not already personalised

if [ ! -f ~/.zshrc ]
then
	wget https://raw.githubusercontent.com/srares76/scripts-repo/master/zsh.txt
	cat zsh.txt >> ~/.zshrc
fi


# Clean up

rm -r ~/scripts

echo =========================================================
echo
echo Done! Everything was installed!