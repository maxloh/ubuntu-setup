sudo apt install gnome-tweaks
sudo apt install dconf-editor
sudo apt-get install Imwheel
# sudo apt install mate-mouse-properties

gsettings set org.gnome.nautilus.desktop trash-icon-visible false
touch ~/Templates/Empty\ Document
dconf load / < dconf.txt
