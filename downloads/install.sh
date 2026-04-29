#!/data/data/com.termux/files/usr/bin/bash

termux-setup-storage

sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list

sed -i 's@^\(deb.*games stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable@' $PREFIX/etc/apt/sources.list.d/game.list

sed -i 's@^\(deb.*science stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list

yes | pkg update

pkg install vim wget git openssh ecj dx tree nodejs python clang zsh -y

npm config set registry https://registry.npm.taobao.org

npm install -g orangex

pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install requests

git clone https://gitee.com/geogra/termux-ohmyzsh.git "$HOME/termux-ohmyzsh" --depth=1

mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "$HOME/termux-ohmyzsh/.termux" "$HOME/.termux"

git clone https://gitee.com/mirrors/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth=1
mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"
echo "alias chcolor='$HOME/.termux/colors.sh'" >> "$HOME/.zshrc"
echo "alias chfont='$HOME/.termux/fonts.sh'" >> "$HOME/.zshrc"

git clone https://gitee.com/home8132/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth=1
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

chsh -s zsh

echo "oh-my-zsh install complete!\nChoose your color scheme now~"
echo -e "\n" | $HOME/.termux/colors.sh

echo "Choose your font now~"
echo -e "\n" | $HOME/.termux/fonts.sh

echo "nohup orangex &" >> "$HOME/.zshrc"

echo "extra-keys = [['ESC','BACKSLASH','|','/','_','>','\`','UP','QUOTE','APOSTROPHE'],['TAB','CTRL','ALT','~','-','&','LEFT','DOWN','RIGHT','$']]" >> "$HOME/.termux/termux.properties"

curl -fsSL https://blog.orangex4.cool/demo/orangex/welcome.txt > "$PREFIX/etc/motd"

git clone https://github.com/OrangeX4/CodeExamples.git --depth=1

echo " ------------------------"
echo "|        Complete        |"
echo "| Please restart Termux. |"
echo " ------------------------"
echo "|          完成          |"
echo "|     请重启 Termux      |"
echo "|  界面发生改变即为成功   |"
echo " ------------------------"