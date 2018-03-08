#!/bin/bash
sudo pacman -S vimpager
sudo pacman -S visual-studio-code-bin
sudo pacman -S git code-git
#sudo pacman -S extra/adobe-source-code-pro-fonts 
#sudo pacman -S extra/adobe-source-code-pro-fonts 2.030ro+1.050it-4
#sudo pacman -SU extra/adobe-source-code-pro-fonts 
#sudo pacman -U extra/adobe-source-code-pro-fonts 
#sudo pacman -U extra/adobe-source-code-pro-fonts 2.030ro+1.050it-4
#sudo pacman -U "extra/adobe-source-code-pro-fonts 2.030ro+1.050it-4"
#sudo pacman -U extra/adobe-source-code-pro-fonts 2.020ro+1.075it-2
#sudo pacman -U extra/adobe-source-code-pro-fonts  2.020ro+1.075it-2
#sudo pacman -U extra/adobe-source-code-pro-fonts
#sudo pacman -U adobe-source-code-pro-fonts
sudo pacman -S st
sudo pacman -S fish
sudo pacman -S chromium
sudo pacman -S termite
#sudo pacman -S terminus-font terminus-font-ttf
sudo pacman -S vtop htop
sudo pacman -S signal slack-desktop
#sudo pacman -S tf-bitstream-vera ttf-dejavu ttf-droid ttf-fira-code ttf-hack ttf-inconsolata ttf-indic-otf ttf-liberation ttf-ms-fonts ttf-roboto
sudo pacman -S ttf-ms-fonts

mkdir -p ~/src
cd ~/src
git clone https://github.com/ryanoasis/nerd-fonts
git clone https://github.com/ryanoasis/vim-devicons
