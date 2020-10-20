#!/bin/bash
git clone https://github.com/WillKoehrsen/recurrent-neural-networks.git
echo "Y" | sudo apt-get update
sudo apt-get install python3-pip
cd recurrent-neural-networks
pip3 install --user -r requirements.txt
cd deployment
sudo python3 run_keras_server.py
