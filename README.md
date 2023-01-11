[![Build](https://github.com/jkaninda/ansible-runner/actions/workflows/build.yml/badge.svg)](https://github.com/jkaninda/ansible-runner/actions/workflows/build.yml)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/jkaninda/ansible-runner?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/jkaninda/ansible-runner?style=flat-square)
# Ansible-runner
Ansible runner

Docker container Ansible Runner, play with Ansible using Docker with mulltiple servers

> Simple docker-compose.yml file

```yaml
version: "3.8"
services:
 controller:
  container_name: controller
  image: jkaninda/ansible-runner:1.0
  hostname: controller
  privileged: true
  command: sleep 1d
  restart: unless-stopped
  ports:
    - 22:22
  volumes:
    - ./master/:/root/
  networks:
   - ansible
 server1:
  container_name: server1
  image: jkaninda/ansible-runner:1.0
  hostname: server1
  privileged: true
  command: sleep 1d
  restart: unless-stopped
  expose:
    - 22
  volumes:
    - ./worker/.ssh:/root/.ssh/
  networks:
   - ansible
 server2:
  container_name: server2
  hostname: server2
  image: jkaninda/ansible-runner:1.0
  privileged: true
  command: sleep 1d
  restart: unless-stopped
  expose:
    - 22
  volumes:
    - ./worker2/.ssh:/root/.ssh/
  networks:
   - ansible
networks:
 ansible:
  external: false
  name: ansible

```
## TO access to the Controller:
### Create /root/.ssh/authorized_keys file and put your public key inside

```sh
 ssh root@127.0.0.1
```
### Or using docker-compose

```sh
docker-compose exec controller bash
```