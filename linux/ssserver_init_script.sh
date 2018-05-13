sudo apt-get update
sudo apt-get install python-pip -y
sudo pip install --upgrade pip
sudo pip install shadowsocks
config='
{ \n
    "server":"0.0.0.0", \n
    "server_port": 1988, \n
    "password":"shadow123", \n
    "local_address":"127.0.0.1", \n
    "method":"aes-256-cfb", \n
    "local_port":1080, \n
    "timeout":300, \n
    "fast_open":false \n
} \n
'
sudo touch /etc/shadowsocks.json
sudo echo -e $config > /etc/shadowsocks.json
sudo ssserver -c /etc/shadowsocks.json -d start

sudo apt-get install zsh
sudo  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

sudo apt-get install -y htop speedtest glances
