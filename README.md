# Jenkins Docker image with preinstalled Docker client

Basic usage

    docker run -it \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v jenkins_home:/var/jenkins_home \
      boomfly/jenkins:lts