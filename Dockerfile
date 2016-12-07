# DESCRIPTION:    Oracle Java jdk-8u112
# SOURCE:         https://github.com/airdock-io/docker-oracle-jdk/tree/master/jdk-8u112

FROM airdock/base:latest
MAINTAINER Jerome Guibert <jguibert@gmail.com>

# Add java dynamic memory script
COPY java-dynamic-memory-opts /srv/java/

# Install Oracle JDK 8u11
RUN cd /tmp && \
    curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/8u112-B15/jdk-8u112-linux-x64.tar.gz" && \
    tar xf jdk-8u112-linux-x64.tar.gz -C /srv/java && \
    rm -f jdk-8u112-linux-x64.tar.gz && \
    ln -s /srv/java/jdk* /srv/java/jdk && \
    ln -s /srv/java/jdk /srv/java/jvm && \
    chown -R java:java /srv/java && \
    /root/post-install

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /srv/java/jdk

# Add /srv/java and jdk on PATH variable
ENV PATH ${PATH}:${JAVA_HOME}/bin:/srv/java
