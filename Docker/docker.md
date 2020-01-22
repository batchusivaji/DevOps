# Docker Installation
[clickhere](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

# easily install ubuntu :
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

sudo usermod docker -aG (your-userlike 'ubuntu')

# Docker hub
*  Docker Hub is a registry service on the cloud that allows you to download Docker images that are built by other communities.

* it is used to pull images from docker hub
* examples
--
Docker pull jenkins
Docker pull ubuntu
Docker pull tomcat8
--
these command are used to create the images in the docker-engine

list out the docker Images 

# Docker images ls 

* ls = list the files

* sudo docker run -it centos /bin/bash

* -it = interactive mode

* /bin/bash is used to run the bash shell once CentOS is up and running

* To run container
* docker run image 
* image = This is the name of the image which is used to run the container


* To Remove Image 
* docker rmi Image-id

* If you want to find ids command "docker image -q" to get only ids list

* To find the details of image or container 
* docker inspect Repository 
* Repository − This is the name of the Image

# Docker - Containers

* sudo docker run –it centos /bin/bash 

 sudo docker ps
 ps- showing all runing containers

 sudo docker ps -a
 ps -a  = showing all avaliable containers

* docker history
  With this command, you can see all the commands that were run with an image via a container.

  docker history Image-id

* Docker top ContainerID (ContainerID − This is the Container ID for which you want to see the top processes)

* docker stop ContainerID (To stop the container) 

* docker rm ContainerID (to remove container)

* docker stats ContainerID (To start the container)

* docker attach ContainerID (to attach container)

* docker pause ContainerID (to pause the container)

* docker unpause ContainerID(TO UNpause the running container)
  
* docker kill ContainerID (it kill the runing containers also)

*  docker Tag (its is used to give the name to the image)
  
*  –d option is used to run the container in detached mode, This is so that the container can run in the background

# configuration

sudo service docker stop  (To stop the service) &  service docker start (To start the service)


# Dockerfile 
---
* FROM tomcat:8
* MAINTAINER (give name or email or any for identy for user )
* Add (give the file source link)
* copy (sorce of the file./gameof file      home/ubuntu/...path)
* Expose 8500
* ENV (enviroment seting process)(var1 = tomcat8)
* volume (path of the volume to storage of docker data)
* workdir (setting directory for the container)(./temp/tomcat)
* RUN apt-get update 
* RUN apt-get install –y nginx 
* CMD [“echo”,”Image created”] 
---
# TO build docker image using Docker file
* docker build  -t ImageName:TagName dir
dir = directory (or) path of the Docker file {if it is in the same path and name is Dockerfile give "." onrly
Examples : sudo docker build –t myimage:0.1. 

# public repository 
crating own repo for images & create the command pull for using from repository

* docker push Repositoryname  (if you want to push your image to Docker hub)

# Docker managing Port 
Docker container run -P jenkins

-P  = capital "p" its create available post for its own range (defult is created)
-p   = small "p"  we should provide the port for required value 

example : -p 8055:8080

8055 = we are give port to that container
8080 = its is help to run the container in http


# Docker Volume 
* volume create for container
  -v (path of the volume) example : –v /home/demo:/var/jenkins_home
* sudo docker volume create –-name = demo –opt o = size = 100m   (give size of the volume)
  
* sudo docker volume ls (To find volume list)

# Docker Networking
* ifconfig (sell all configurations)
  
* docker network ls (list out the all networks)
  
* docker network inspect networkname (if you want to see more details Inspecting a Docker network) 
  
* sudo docker network inspect bridge (To see the all network in briage view)
  
* docker network create –-driver drivername name (drivername − This is the name used for the network driver)(name − This is the name    given to the network).
  
* runing new network using this command(sudo docker run –it –network=new_nw ubuntu:latest /bin/bash)

* sudo docker network inspect new_nw (inspect the network new_nw)
  

----
* docker network connect "name of the container"(ip of the containe, network_name, link)
* docker network disconnect "(same as above)"
* docker network inspect "name of container 'or' image"(To check the connection of network)
* docker network ls (list the networks)
* docker network create [OPTIONS] "NETWORK_Name" --subnet ,--gateway --ingress(inboundrules)

[clickhere](https://docs.docker.com/engine/reference/commandline/network_create/)

* docker network rm (name of the network)
* docker network prune (it remove which network is not runing)
  
----