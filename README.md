# Jenkins Docker image with preinstalled Docker client

## Quirk

When docker mount `/var/run/docker.sock` volume it might have random GID
On Ubuntu

    vim /etc/group

Scroll to bottom and find similar line

    docker:x:998:YOUR_USERNAME

Change 998 to 1001

    docker:x:1001:YOUR_USERNAME

## Basic usage

    docker run -it \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v jenkins_home:/var/jenkins_home \
      boomfly/jenkins:lts
