[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# lsioarmhf/htpcmanager
[![](https://images.microbadger.com/badges/version/lsioarmhf/htpcmanager.svg)](https://microbadger.com/images/lsioarmhf/htpcmanager "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/lsioarmhf/htpcmanager.svg)](http://microbadger.com/images/lsioarmhf/htpcmanager "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/lsioarmhf/htpcmanager.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/lsioarmhf/htpcmanager.svg)][hub][![Build Status](http://jenkins.linuxserver.io:8080/buildStatus/icon?job=Dockers/LinuxServer.io-armhf/lsioarmhf-htpcmanager)](http://jenkins.linuxserver.io:8080/job/Dockers/job/LinuxServer.io-armhf/job/lsioarmhf-htpcmanager/)
[hub]: https://hub.docker.com/r/lsioarmhf/htpcmanager/

Htpcmanager, a front end for many htpc related applications. Hellowlol version.[Htpcmanager](https://github.com/Hellowlol/HTPC-Manager)

[![htpcmanager](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/htpcmanager-icon.png)][htpcurl]
[htpcurl]: https://github.com/Hellowlol/HTPC-Manager

## Usage

```
docker create --name=htpcmanager \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 8085:8085 \
lsioarmhf/htpcmanager
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 8085` - the port(s)
* `-v /config` - where htpcmanager should store its configuration files.
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

It is based on alpine-linux with s6 overlay, for shell access whilst the container is running do `docker exec -it htpcmanager /bin/bash`.


### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application
`IMPORTANT... THIS IS THE ARMHF VERSION`

The webui is found at port 8085.

Smartmontools has not been included, you can safely ignore the warning error in the log.

## Info

* To monitor the logs of the container in realtime `docker logs -f htpcmanager`.


* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' htpcmanager`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' lsioarmhf/htpcmanager`

## Versions

+ **07.02.17:** Rebase to alpine 3.5. 
+ **14.10.16:** Add version layer information.
+ **26.09.16:** Add back cherrypy after removal from baseimage.
+ **11.09.16:** Add layer badges to README.
+ **07.09.16:** Initial Release.
