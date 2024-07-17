#!/bin/bash
echo "If your server is ubuntu 24.04 , please input ctrl+c , because cloudflare isn't have compatible versions"
echo "It work in 40000 port , so you need a x-ui config socks."
echo "Do you want install it? "
read -p "please input enter start install." a
sudo apt update && sudo apt upgrade -y
bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh) 
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo rm /etc/apt/sources.list.d/cloudflare-client.list
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt update&&sudo apt upgrade -y&&apt install cloudflare-warp -y&&warp-cli register
warp-cli mode proxy&&warp-cli connect