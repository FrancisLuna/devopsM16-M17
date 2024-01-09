# Ubuntu image
FROM ubuntu:latest

# Update and install package
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# Download and install Plex Media Server    
RUN curl -LO "https://downloads.plex.tv/plex-media-server-new/1.32.6.7557-1cf77d501/debian/plexmediaserver_1.32.6.7557-1cf77d501_amd64.deb" && \
    dpkg -i plexmediaserver_1.32.6.7557-1cf77d501_amd64.deb

# Add port and volumes
EXPOSE 32400
VOLUME /config
VOLUME /media

CMD ["/usr/lib/plexmediaserver/Plex Media Server", "-c", "/usr/sbin/start_pms", "/config", "/media"]
