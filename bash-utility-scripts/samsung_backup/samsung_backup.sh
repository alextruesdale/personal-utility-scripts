#!/usr/bin/env bash

echo "... syncing: data backups (app list, brew, pip3, zsh, iterm, atom)"
echo

cd ~/Desktop/data/pip3
pip3 list > pip3_info.txt
pip3 freeze > pip3_installme.txt

cd ../brew
rm Brewfile
brew bundle dump
brew list > brew_installme.txt
cat Brewfile >> Brewfile.txt

cd ~/
rsync -av --exclude='.git/' .oh-my-zsh /Users/alextruesdale/Desktop/data/zsh/
cp .zshrc /Users/alextruesdale/Desktop/data/zsh/
cd /Users/alextruesdale/Desktop/data/zsh
rm -r oh-my-zsh
mv .oh-my-zsh oh-my-zsh
mv .zshrc zshrc_config

ls /Users/alextruesdale/.atom/packages > /Users/alextruesdale/Desktop/data/atom/package_list.txt
cp -r /Users/alextruesdale/.atom/packages/solarised-neu /Users/alextruesdale/Desktop/data/atom/
cp /Users/alextruesdale/.atom/styles.less /Users/alextruesdale/Desktop/data/atom/
cd ~/

find /Applications -maxdepth 1 -iname '*.app' > ~/Desktop/data/application_list.txt

echo
echo "update complete: data backups"
echo "... syncing: downloads"
echo

rsync -av --delete-delay ~/Downloads/ /Volumes/SamsungT5/Google\ Drive/macbook_backup/Downloads/

echo
echo "update complete: downloads"
echo "... syncing: documents"
echo

rsync -av --delete-delay --exclude-from='/Users/alextruesdale/Documents/personal-utility-scripts/bash-utility-scripts/samsung_backup/exclude_me.txt' /Users/alextruesdale/Documents/ /Volumes/SamsungT5/Google\ Drive/macbook_backup/Documents/

echo
echo "update complete: documents"
echo "... syncing: desktop"
echo

rsync -av --delete-delay ~/Desktop/ /Volumes/SamsungT5/Google\ Drive/macbook_backup/Desktop/

echo
echo "update complete: desktop"
echo "... syncing: library"
echo

cd ~/Library
rsync -av Preferences /Volumes/SamsungT5/Google\ Drive/macbook_backup/Library/
rsync -av Cookies /Volumes/SamsungT5/Google\ Drive/macbook_backup/Library/

echo
echo "update complete: library"
