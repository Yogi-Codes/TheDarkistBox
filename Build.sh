
echo "[+] It Is Expected That Build.sh and TheDarkistFiles.zip   will be uploaded to /var/ "
echo "[+] Building TheDarkist"
echo "[+] OS:  Ubuntu Server 22.04.1 LTS"
echo "[+] Author: ANIK GHOSH"
echo "[+] Date: 2022-12-23"
echo "[+] Point Value: 10"
mkdir /var/www

mkdir /var/www/html
chmod +x TheDarkistFiles.zip
mv TheDarkistFiles.zip /var/www/html
cd /var/www/html
apt install unzip -y
echo "[+] Disabling history files"
ln -sf /dev/null /root/.bash_history
ln -sf /dev/null /home/Ghyophoggua/.bash_history

echo "[+] Installing utilities"
apt install -y net-tools vim open-vm-tools -y
sudo apt-get install openssh-server -y


echo "[+] Installing Apache"
apt install apache2 -y

cd /var/www/html

apt install net-tools

rm -rf /var/www/html/index.html

cd /var/www/html
 
echo "[+] Creating Directories"

mkfolder() 
{
names=(Ghyophoggua1 Ghyophoggua2 Ghyophoggua3 Ghyophoggua4 Ghyophoggua5 Ghyophoggua6 Ghyophoggua7 Ghyophoggua8)

# Loop through the array and create a folder for each name
for name in "${names[@]}"; do
  mkdir "$name"
done
}

cd  /var/www/html/Ghyophoggua1

mkfolder

cd /var/www/html/Ghyophoggua2

mkfolder

cd /var/www/html/Ghyophoggua3
mkfolder

cd /var/www/html/Ghyophoggua4

mkfolder

cd /var/www/html/Ghyophoggua5
mkfolder


cd /var/www/html/Ghyophoggua6

mkfolder

cd /var/www/html/Ghyophoggua7

mkfolder


cd /var/www/html/Ghyophoggua8

mkfolder


cd /var/www/html/Ghyophoggua7

cd /var/www/html/Ghyophoggua7/Ghyophoggua7


cd /var/www/html


unzip TheDarkistFiles.zip    


mv ThisIsForMatt.txt  /var/www/html/Ghyophoggua7/Ghyophoggua7/ThisIsForMatt.txt

mkdir /var/ftp

apt install ufw -y
ufw status
ufw enable
ufw status

apt install vsftpd -y
mv /etc/vsftpd.conf /etc/vsftpd.conf.orig
mv vsftpd.conf /etc/

ufw allow 20/tcp

ufw allow 21/tcp

ufw status

ufw allow ftp-data
cp AbsolutelyEmptyAndUselessAudio.wav  /var/ftp
mv AbsolutelyEmptyAndUselessAudio.wav  /srv/ftp

rm /etc/ssh/sshd_config
mv sshd_config  /etc/ssh/


/sbin/service sshd status
/sbin/service sshd start

ufw allow 22/tcp


echo "[+] Creating users if they don't already exist"
id -u Ghyophoggua &>/dev/null || useradd -m Ghyophoggua


echo "Ghyophoggua:Super1337P@\$\$" | chpasswd

echo "[+] Creating users if they don't already exist"
id -u root &>/dev/null || useradd -m root


echo "root:darkist1" | chpasswd


mkdir /home/Ghyophoggua
mkdir /home/root

echo 'Will_you_Hecker' | md5sum > /home/Ghyophoggua/local.txt	


echo 'you_Hecker' | md5sum > /home/root/proof.txt

chmod 0700 /root/proof.txt
chmod 0644 /home/Ghyophoggua/local.txt
chown Ghyophoggua:Ghyophoggua /home/Ghyophoggua/local.txt 



chmod +777 /var/log/apache2/access.log



cd /var/www/html/


mkdir  zikimokbaka
cd  zikimokbaka
mkdir yakayaz



mv /var/www/html/access.php  /var/www/html/zikimokbaka/yakayaz
mv /var/www/html/access.log  /var/www/html/zikimokbaka/yakayaz

chmod +777 /var/www/html/zikimokbaka/yakayaz/access.log

sudo apt-get autoclean -y

sudo apt-get clean -y

sudo add-apt-repository ppa:ondrej/php -y

sudo apt update

apt install php7.3 -y

sudo apt install libapache2-mod-php7.3 -y

sudo a2enmod php7.3 -y 






mv /var/www/html/dark.py  /home/Ghyophoggua/


chmod u+s   /home/Ghyophoggua/dark.py


echo "ghyophoggua ALL=(root) NOPASSWD: /usr/bin/python3* /home/Ghyophoggua/dark.py" | sudo tee -a /etc/sudoers     #working

ufw allow 80/tcp

cd /var/www/html/


sudo killall -9 vsftpd
sudo service vsftpd restart


chmod ug-r /home/root
chmod -r /home/root
chmod +644 /home/Ghyophoggua/local.txt
chmod +700 /home/root/proof.txt
chmod +700  /home/root/
chmod ug-xr  /home/root/
chmod 700  /home/root/
chmod +700  /home/root/
chmod u-r  /home/root/
chmod -r  /home/root/
chmod -x  /home/root/
chmod +700  /home/root/

sudo chown root:root /home/root
sudo chown root:root /home/root/proof.txt
chmod -777 /home/Ghyophoggua
chmod +555 /home/Ghyophoggua


echo "[+] Cleaning up"
rm -rf build.sh
rm -rf TheDarkistFiles.zip
rm -rf access.php
rm -rf access.log
rm -rf sshd_config
rm -rf dark.py
rm -rf AbsolutelyEmptyAndUselessAudio.wav
rm -rf vsftpd.conf
rm -rf ThisIsForMatt.txt
find /var/log -type f -exec sh -c "cat /dev/null > {}" \;





















































