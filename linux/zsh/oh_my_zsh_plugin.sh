#part 1
sudo apt-get update
sudo apt-get install curl wget git zsh vim -y
#  set zsh as default
chsh -s `which zsh`
#need reboot
#sudo shutdown -r 0
#part 2
chsh -s /bin/zsh
# install oh_my_zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# add "zsh-syntax-highlighting" plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# get key words
cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh
# add "zsh-autosuggestions" plugin
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# add "git-open" plugin
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
vim ~/.zshrc
# set plugins
# "sublime z zsh-syntax-highlighting zsh-autosuggestions git-open themes"
# set alias
echo 'alias go="git-open"' >> ~/.zshrc
echo 'alias cp="cp-i"' >> ~/.zshrc
echo 'alias brew="sudo apt"' >> ~/.zshrc
#surge
echo 'export https_proxy=http://127.0.0.1:8888;export http_proxy=http://127.0.0.1:8888;# export all_proxy=socks5://127.0.0.1:8889' >> ~/.zshrc
#zubuntu
echo 'export https_proxy=http://127.0.0.1:12333;export http_proxy=http://127.0.0.1:12333;# export all_proxy=socks5://127.0.0.1:12333' >> ~/.zshrc
source ~/.zshrc
# ZSH_THEME="random"