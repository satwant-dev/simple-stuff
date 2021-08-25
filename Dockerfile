FROM docker.io/ibmcom/websphere-liberty:20.0.0.5-full-java11-openj9-ubi
COPY target/simple-stuff.war /config/dropins/
COPY config/server.xml /config/
COPY config/server.env /config/
RUN mkdir -p /my-special-folder
RUN chown newuser /my-special-folder
USER newuser
WORKDIR /my-special-folder
COPY Dockerfile /my-special-folder/
