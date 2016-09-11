FROM lsiobase/alpine.python.armhf
MAINTAINER sparklyballs

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8085
VOLUME /config
