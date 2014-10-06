#!/bin/bash -eux

export old_pwd=$(pwd)
sudo chmod 777 -R /opt
cd /opt
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64-bit stuff here
  JAVA_TAR_NAME="jdk-7u67-linux-x64.gz"
else
  # 32-bit stuff here
  JAVA_TAR_NAME="jdk-7u67-linux-i586.gz"
fi
sudo wget http://epbyminsd0259t1/userContent/yum-repo/$JAVA_TAR_NAME
#gunzip jdk-7u67-linux-x64.gz
#mv jdk-7u67-linux-x64.gz jdk-7u67-linux-x64.tar
#sudo tar xvzf jdk-7u67-linux-x64.gz
sudo tar xzf $JAVA_TAR_NAME
sudo rm -rf $JAVA_TAR_NAME
sudo ln -s /opt/jdk1.7.0_67 java
sudo echo 'JAVA_HOME=/opt/java' >> /etc/environment
sudo echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
echo $old_pwd
cd $old_pwd
