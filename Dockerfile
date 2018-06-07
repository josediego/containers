FROM amd64/ubuntu:16.04

RUN apt-get update && apt-get install -y apt-transport-https \
    gnupg \
    ca-certificates \
    curl \
    software-properties-common \
    sudo \
    virtualbox \
    virtualbox-ext-pack 

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN apt-key fingerprint 0EBFCD88

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN apt-get update && apt-get install -y docker-ce

RUN curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && mv ./minikube /usr/local/bin/minikube 
RUN curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl && mv ./kubectl /usr/local/bin/kubectl

RUN useradd -m -d /home/h1 h1 
RUN usermod -aG sudo h1
RUN echo h1:secret | chpasswd

# RUN minikube config set vm-driver none
# RUN ./minikube start