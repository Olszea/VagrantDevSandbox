###################################################
echo "Installing:"

LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php > /dev/null 2>&1
apt-get update > /dev/null 2>&1

###################################################

echo "- PHP 7.0"
apt-get install -y python-software-properties > /dev/null 2>&1
apt-get install -y php7.0 > /dev/null 2>&1

###################################################

echo "- Apache2"
apt-get install -y apache2 > /dev/null 2>&1

a2dissite 000-default.conf > /dev/null 2>&1

cp /var/www/test/virtual_host /etc/apache2/sites-available/test.loc.conf
a2ensite test.loc.conf > /dev/null 2>&1

a2enmod rewrite > /dev/null 2>&1

service apache2 restart > /dev/null 2>&1

###################################################

echo "- MySQL"

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server > /dev/null 2>&1

###################################################

echo "- some other stuff"
apt-get install -y --force-yes libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json php-xml > /dev/null 2>&1

###################################################

echo "- GIT"
apt-get install -y git > /dev/null 2>&1

echo "- Midnight Commander"
apt-get install -y mc > /dev/null 2>&1

echo "- Composer"
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer > /dev/null 2>&1

###################################################
echo "Installation process FINISHED"

echo "__________________________________________________________________"
echo "    ______              ______                 _ _                "
echo "   (______)            / _____)               | | |               "
echo "    _     _ _____ _   ( (____  _____ ____   __| | |__   ___ _   _ "
echo "   | |   | | ___ | | | \____ \(____ |  _ \ / _  |  _ \ / _ ( \ / )"
echo "   | |__/ /| ____|\ V /_____) ) ___ | | | ( (_| | |_) ) |_| ) X ( "
echo "   |_____/ |_____) \_/(______/\_____|_| |_|\____|____/ \___(_/ \_)"
echo "__________________________________________________________________"
echo ""
echo "check it on https://github.com/mhyndle"
