#!/bin/sh

# Author: David Martins
# Date: 16 Oct' 2020
# Version: v0.1


if (whoami != root)
    then echo "You need to execute this script as root (superuser)."
    exit
fi

sudo apt-get update				# Atualiza os pacotes de instalacao

###################################################################
#             INSTALACAO E CONFIGURACAO DO AMBIENTE               #
###################################################################

echo "[osrs-instance] > Installing htop..."
sudo apt install htop -y                # Instala o htop (gestor de tarefas)
echo "[osrs-instance] > Installing wget..."
sudo apt install wget -y                # Instala o wget (download)
echo "[osrs-instance] > Installing xfce..."
sudo apt install xfce4 -y               # Instala o xfce
echo "[osrs-instance] > Installing xrdp..."
sudo apt install xrdp -y                # Instala o Xrdp
sudo adduser xrdp ssl-cert              # Adiciona o user default do Xrdp
echo "[osrs-instance] > Restarting xrdp service..."
sudo systemctl restart xrdp             # Dá restart ao servico Xrdp

###################################################################
#             INSTALACAO E CONFIGURACAO DO JAVA 8                 #
###################################################################

echo "[osrs-instance] > Installing jdk 8..."
sudo apt-get install openjdk-8-jdk -y	# Instala o Jdk 8
echo "[osrs-instance] > Java 8 has been installed!"
java -version

###################################################################
#                 DOWNLOAD DO OSRS E DO BOT                       #
###################################################################

echo "[osrs-instance] > Downloading client..."
sudo wget https://osbot.org/mvc/get
mv get osbot.jar                         # Muda o nome do ficheiro
chmod +x osbot.jar                       # Da permissoes de execucao ao ficheiro

echo "[osrs-instance] > Creating sub instances..."

echo 'sudo java -jar osbot.jar' > startbot_default.sh	 								 # Cria um fichiro executavel para iniciar o bot
echo 'sudo java -jar osbot.jar -login mendigo:osbotpwd098123#' > startbot_mendigo.sh	 # Cria um fichiro executavel para iniciar o bot
chmod +x startbot_default.sh															 # Da permissoes de execucao ao ficheiro
chmod +x startbot_mendigo.sh															 # Da permissoes de execucao ao ficheiro

# Dá print de algumas informações
printf "\nCria um utilizador padrao.\n
Esse utilizador vai ser utilizado para iniciares sessao no Xrdp\n
Usa uma password segura!!!\n"
