#!/usr/bin/env bash
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install -y nodejs
cd /vagrant/FMP/frontend


sudo sh -c 'npm install'
sudo sh -c 'npm start &'
