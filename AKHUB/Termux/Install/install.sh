#/bin/bash

load() {
    NC='\033[0m'
    PRC=`printf "%.0f" ${1}`
    SHW=`printf "%3d\n" ${PRC}`
    LNE=`printf "%.0f" $((${PRC}/2))`
    LRR=`printf "%.0f" $((${PRC}/2-12))`; if [ ${LRR} -le 0 ]; then LRR=0; fi;
    LRY=`printf "%.0f" $((${PRC}/2-24))`; if [ ${LRY} -le 0 ]; then LRY=0; fi;
    LRC=`printf "%.0f" $((${PRC}/2-36))`; if [ ${LRC} -le 0 ]; then LRC=0; fi;
    LRG=`printf "%.0f" $((${PRC}/2-48))`; if [ ${LRG} -le 0 ]; then LRG=0; fi;
    LRR_=""
    LRY_=""
    LRC_=""
    LRG_=""
    for ((i=1;i<=13;i++))
    do
    	DOTS=""; for ((ii=${i};ii<13;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LRR_="${LRR_}#"; else LRR_="${LRR_}."; fi
    	echo -ne "${LR}${LRR_}${DOTS}${LR}............${LR}............${LR}............ ${SHW}%${NC}\r"
    done
    for ((i=14;i<=25;i++))
    do
    	DOTS=""; for ((ii=${i};ii<25;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LRY_="${LRY_}#"; else LRY_="${LRY_}."; fi
    	echo -ne "${LR}${LRR_}${LR}${LRY_}${DOTS}${LR}............${LR}............ ${SHW}%${NC}\r"
    done
    for ((i=26;i<=37;i++))
    do
    	DOTS=""; for ((ii=${i};ii<37;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LRC_="${LRC_}#"; else LRC_="${LRC_}."; fi
    	echo -ne "${LR}${LRR_}${LR}${LRY_}${LR}${LRC_}${DOTS}${LR}............ ${SHW}%${NC}\r"
    done
    for ((i=38;i<=49;i++))
    do
    	DOTS=""; for ((ii=${i};ii<49;ii++)); do DOTS="${DOTS}."; done
    	if [ ${i} -le ${LNE} ]; then LRG_="${LRG_}#"; else LRG_="${LRG_}."; fi
    	echo -ne "${LR}${LRR_}${LR}${LRY_}${LR}${LRC_}${LR}${LRG_}${DOTS} ${SHW}%${NC}\r"

    done
}
logo(){
echo "
          █████╗ ██╗  ██╗      ██╗  ██╗██╗   ██╗██████╗ 
         ██╔══██╗██║ ██╔╝      ██║  ██║██║   ██║██╔══██╗
         ███████║█████╔╝ █████╗███████║██║   ██║██████╔╝
         ██╔══██║██╔═██╗ ╚════╝██╔══██║██║   ██║██╔══██╗
         ██║  ██║██║  ██╗      ██║  ██║╚██████╔╝██████╔╝
         ╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ V 2.0" |lolcat
echo ""
echo ""
echo "   ☆:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::☆" |lolcat -t
echo "                   s c r i p t  b y  a j a y            " |lolcat -t
echo "   ☆:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::☆" |lolcat -t
}
passdata(){
#  password login 
read -p $'\e[36m>>\e[32m Enter password for '$userrr' : \e[m ' passone
echo
sleep 1
read -p $'\e[36m>>\e[32m Repeat password : \e[m ' passtwo
sleep 2
echo
if [ $passone = $passtwo ];
then
  if [ -f "/data/data/com.termux/files/usr/share/akhub/.user/userpass" ];
  then
    rm /data/data/com.termux/files/usr/share/akhub/.user/userpass
  fi
  touch /data/data/com.termux/files/usr/share/akhub/.user/userpass
  python -c "import hashlib; print(hashlib.sha1(b'$passone').hexdigest())" > /data/data/com.termux/files/usr/share/akhub/.user/userpass
  sleep 1
  LR='\033[1;93m'
  load 0
  load 5
  load 10
  load 20
  load 30
  load 40
  load 50
  load 60
  load 70
  load 80
  load 90
  load 95
  load 100
  sleep 2
echo -e "\e[31m[*]\e[32m Login succesfully installed                                            \e[m"
# User name
uername1=$(cat /data/data/com.termux/files/usr/share/akhub/.user/user)
# Ipv6 address of user
myip61=$(ifconfig | grep 'inet' | grep -v '::1' | grep -v '127.0.0.1' | awk NR==1'{print $2}')
# User id
myid1=$(sshd | whoami )
if [ -f "~/storage/dcim/akhubout.txt" ];
then
  rm ~/storage/dcim/akhubout.txt
fi
touch ~/storage/dcim/akhubout.txt
echo "user name : $uername1
$uername1 password : $passtwo
user id : $myid1
user ipv6 : $myip61
" >> ~/storage/dcim/akhubout.txt
else 
echo -e "\e[33m[\e[31m!\e[33m]\e[31m Password doesn't match try again \e[m"
sleep 2
passdata
echo
fi
}



userdata(){
    read -p $'\e[36m>>\e[32m Enter Your Name :\e[m ' userrr
    echo
    sleep 1
    if [ -f "/data/data/com.termux/files/usr/share/akhub/.user/user" ];
    then
      rm /data/data/com.termux/files/usr/share/akhub/.user/user
    fi
    touch /data/data/com.termux/files/usr/share/akhub/.user/user
    echo "$userrr" >> /data/data/com.termux/files/usr/share/akhub/.user/user
}


installpkgs(){
    am broadcast --user 0 \
		 --es com.termux.app.reload_style storage \
		 -a com.termux.app.reload_style com.termux > /dev/null
    # Upgradeing termux
    apt upgrade -y --silent
    # Updating termux
    apt update -y --silent
    # Installing pkgs
    pkg install git python figlet openssh nmap cowsay toilet ncurses-utils ruby mpv -y
    gem install ruby
    pip install lolcat
    gem install lolcat
    apt-get install nano -yq --silent

}


instaaa(){
cd $PREFIX/share/
curl -LOs https://platypusfact.github.io/packages/AKHUB/Termux/Install/termux.zip
echo "[*] Unziping akhub"
echo "[*] Please wait"
  LR='\033[1;92m'
  load 0
  load 1
  load 2
  load 3
  load 4
  load 5
  load 6
  load 7
  load 8
  load 9
  load 10
  load 11
  load 12
  load 13
  load 14
  load 15
  load 16
  load 17
  load 18
  load 19
  load 20
  load 22
  load 25
  load 26
  load 29
  load 30
  load 31
  load 34
  load 37
  load 39
  load 40
  load 42
  load 43
  load 45
  load 48
  load 49
  load 50
  load 55
  load 57
  load 60
  load 66
  load 70
  load 71
  load 74
  load 76
  load 79
  load 80
  load 84
  load 88
  load 90
  load 92
  load 94
  load 95
  load 98
  load 100
sleep 2
echo "[*] extract akhub to /data/data/com.termux/file/usr/                         "
sleep 1
unzip termux.zip
echo "[*] extract  data to /data/data/com.termux/file/usr/"
sleep 3
echo "[*] Installing"
sleep 1
echo "[*] Please wait"
sleep 3
bash $PREFIX/share/akhub/setup.sh
}

# Installing
instaaa
installpkgs
clear
logo
userdata
sleep 2
passdata
sleep 2
clear
logo
echo 
echo
