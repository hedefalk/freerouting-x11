FROM ubuntu:latest
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository universe
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openjdk-17-jdk x11vnc xvfb
RUN mkdir ~/.vnc /app
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
COPY entrypoint.sh /entrypoint.sh
RUN mkdir /opt/app
ADD https://github.com/freerouting/freerouting/releases/download/v1.9.0/freerouting-1.9.0.jar /opt/app/freerouting.jar
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# docker build . -f Dockerfile-fakex11 -t woodenstake/freeroutingx11:v1.8.0
# https://stackoverflow.com/questions/73209656/java-awt-headlessexception-no-x11-display-variable-was-set-but-this-program-pe
