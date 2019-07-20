FROM jenkins/jenkins:lts
 
USER root
RUN apt-get update
RUN apt-get install  sudo 
RUN rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN groupadd -g 999 docker
RUN usermod -a -G root jenkins
RUN usermod -a -G docker jenkins
 
USER jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt


