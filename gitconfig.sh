git config --global user.github PhyM73

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.df "diff --color"

git config --global push.default simple
git config --global color.ui auto
git config --global commit.template ~/.gitmessage.txt
