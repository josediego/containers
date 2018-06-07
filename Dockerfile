FROM ubuntu

COPY cat.sh cat.sh
RUN chmod +x cat.sh

RUN apt-get update && apt-get install -y apt-transport-https \
    gnupg \
    ca-certificates \
    curl \
    software-properties-common

RUN curl -fsSL test.docker.com | sh
   
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
RUN ./cat.sh

RUN apt-get update

RUN apt-get install -y kubectl

RUN curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.27.0/minikube-linux-amd64 && chmod +x minikube && mv minikube /usr/local/bin/