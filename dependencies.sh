#!/bin/bash
echo "Updating packages ...";
sudo apt-get -y update;
echo "Install apache web server";
sudo apt -y install apache2;
systemctl status apache2;
echo "Installed Apache";

echo "allow traffic on port 80";
sudo ufw status;
sudo ufw --force enable
echo "y" | sudo ufw enable;
sudo ufw allow 'Apache';
sudo ufw status;

echo "Checking the service status";
sudo systemctl is-active --quiet apache2 && echo apache2 is running;

ip=$(hostname -I);
echo "Opening the apache default page $ip";
echo "Website is accessible @ http://$ip";
curl $ip

echo "Installing flyway"
wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/7.10.0/flyway-commandline-7.10.0-linux-x64.tar.gz | tar xvz && sudo ln -s `pwd`/flyway-7.10.0/flyway /usr/local/bin
ln -s /opt/flyway /usr/local/bin/flyway
sudo chmod 755 -R /usr/local/bin/flyway
whereis flyway
which flyway
flyway --version

exit;
