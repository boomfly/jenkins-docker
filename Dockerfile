FROM jenkins/jenkins:lts

USER root

RUN useradd docker

RUN apt-get update && apt-get -y install \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg-agent \
      software-properties-common && \
   curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
   add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y install docker-ce && \
   apt-get clean autoclean && apt-get autoremove && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN usermod -aG docker jenkins

USER jenkins