FROM resin/rpi-raspbian:jessie

RUN apt-get update && \
    apt-get upgrade -q -y && \
    apt-get install -q -y --no-install-recommends openjdk-7-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/takezoe/gitbucket/releases/download/3.9/gitbucket.war /opt/gitbucket.war

RUN ln -s /gitbucket /root/.gitbucket

VOLUME /gitbucket

# Port for web page
EXPOSE 8080
# Port for SSH access to git repository (Optional)
EXPOSE 29418

CMD ["java", "-jar", "/opt/gitbucket.war"]
