sudo apt-get update
sudo apt-get install curl wget git zsh vim -y
#  set zsh as default
chsh -s `which zsh`
# install oh_my_zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# add plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh
sed -i 's/plugins=(git)/plugins=(git z zsh-syntax-highlighting zsh-autosuggestions history command-not-found cp git-open sublime themes)/g' ~/.zshrc
echo 'alias zshconfig="source ~/.zshrc"' >> ~/.zshrc
# surge | clash
echo 'export https_proxy=http://127.0.0.1:8888;export http_proxy=http://127.0.0.1:8888;# export all_proxy=socks5://127.0.0.1:8889' >> ~/.zshrc
source ~/.zshrc