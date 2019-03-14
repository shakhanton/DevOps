FROM maven:3.6.0-jdk-8
WORKDIR /home/app
COPY . /home/app
RUN mvn -B -f pom.xml dependency:resolve
#RUN mvn clean install spring-boot:repackage
ENTRYPOINT mvn clean spring-boot:run
