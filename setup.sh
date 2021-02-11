# Download all the scripts

if [ ! -d ~/scripts ]
then
	mkdir ~/scripts
fi
cd ~/scripts
pwd

wget https://raw.githubusercontent.com/srares76/scripts-repo/master/install-brew.sh
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/subl
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/getbattery
wget https://raw.githubusercontent.com/srares76/scripts-repo/master/ccompile
sudo chmod a+x * 


# Move them on Desktop 

for each in $(ls ~/scripts)
do
	if [ ! -f /usr/local/bin/"$each" ]
	then
		echo Mut $each in bin
		cp "$each" /usr/local/bin/
	fi
done


# Install brew
brew help &> /dev/null || ./install-brew.sh


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


# Install essentials

echo "installing essentials..."
sleep 2
brew install whatsapp
brew install alfred
brew install spectacle


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