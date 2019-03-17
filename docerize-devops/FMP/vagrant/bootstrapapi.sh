#!/usr/bin/env bash
sudo yum install wget -y
cd /opt/
sudo wget -nv --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz"
sudo tar xzf jdk-8u201-linux-x64.tar.gz
cd jdk1.8.0_201/
sudo alternatives --install /usr/bin/java java /opt/jdk1.8.0_201/bin/java 2
#sudo alternatives --config java -y
sudo alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_201/bin/jar 2
sudo alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_201/bin/javac 2
sudo alternatives --set jar /opt/jdk1.8.0_201/bin/jar
sudo alternatives --set javac /opt/jdk1.8.0_201/bin/javac
sudo sh -c 'echo -e "export PATH=${PATH}:/opt/jdk1.8.0_201/bin:/opt/jdk1.8.0_201/jre/bin\nexport JAVA_HOME=/opt/jdk1.8.0_201\nexport JRE_HOME=/opt/jdk1.8.0_201/jre" > /etc/profile.d/java.sh'

sudo yum install maven -y

#cd /opt
#sudo wget -nv http://www-us.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
#sudo tar -xf apache-maven-3.5.4-bin.tar.gz
#sudo mv apache-maven-3.5.4/ apache-maven/
#sudo sh -c 'echo -e "export PATH=${PATH}:/opt/apache-maven/bin" > /etc/profile.d/maven.sh'




# sudo sh -c 'echo -e "export M2_HOME=/usr/local/src/apache-maven\nexport PATH=${M2_HOME}/bin:${PATH}" > /etc/profile.d/maven.sh'
# sudo chmod +x /etc/profile.d/maven.sh
# sudo sh -c 'echo "/opt/apache-maven/bin" >> /etc/profile.d/sh.local'
# rm -f /opt/apache-maven-3.5.4-bin.tar.gz



cd /vagrant/FMP/api
sudo sh -c 'mvn -B -f pom.xml dependency:resolve'
sudo sh -c 'mvn clean spring-boot:run &'
