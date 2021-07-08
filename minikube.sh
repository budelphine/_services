#!/bin/bash
# * Preset from MDENYS

pc_name=$HOSTNAME

echo -e "\033[1m\033[36mЗапускаем установку minikube для $pc_name\033[0m" | sed 's/.kzn.21-school.ru//'

 if brew ls --versions > /dev/null; then
 	echo -e "\033[1m\033[35mВсе отлично!\033[0m"
 	cd ~
 else
 	echo -e "\033[1m\033[35mПридется поставить\033[0m"
 	curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
 	cd ~
 fi

minikube delete
rm -rf ~/.minikube
rm -rf ~/goinfre/.minikube
brew remove minikube
brew install minikube
cd ~
brew unlink minikube
brew link minikube
mkdir -p .minikube
mv .minikube ./goinfre
ln -s ./goinfre/.minikube .minikube
echo -e "\033[1m\033[35mMINIKUBE START\033[0m"
# minikube start --vm-driver=virtualbox