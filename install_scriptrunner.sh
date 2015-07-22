sudo mkdir /db
sudo chmod 777 /db
sqlplus -s / as sysdba << EOF
ALTER USER sys IDENTIFIED BY vagrant;
alter system set db_create_file_dest = '/db';
exit;
EOF

sudo iptables -F
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo service iptables save

sudo yum -y install java-1.7.0-openjdk.x86_64
java -jar /vagrant/ScriptRunner.jar --install --newpromoteuser PROMOTEMGR --newpromotepassword vagrant --jdbc jdbc:oracle:thin:@127.0.0.1:1521:XE --password vagrant


