FROM centos:7

COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo


RUN yum -y update && yum clean all && \
    yum install -y bash-completion  \
    gcc g++ make mysql mysql-devel mysql-server pcre-devel zlib-devel git

# FROM ubuntu:18.04
# ENV DEBIAN_FRONTEND noninteractive
# RUN apt-get update && \
#     apt-get install -y vim bash curl yum && \
#     apt-get clean
    
# RUN bash
# RUN apt update && apt -y upgrade
# RUN apt -y install build-essential zlib1g-dev libpcre3-dev
# RUN apt -y install libmariadb-dev libmariadb-dev-compat
# RUN apt -y install mysql-client 
# RUN apt -y install mysql-server
# RUN apt-get update && apt-get clean
# RUN apt -y remove mysql-common
# RUN apt -y install mariadb-server libmysqlclient-dev
# RUN apt -y install make zlib1g-dev rsync cmake 
# RUN apt -y install g++-5
# RUN apt -y install gcc-5
# RUN apt -y install git vim iputils-ping
# RUN apt -y install dos2unix
# RUN apt-get -y install default-libmysqlclient-dev
# RUN apt update && apt -y upgrade

# ---- File Emulador ---- #
RUN mkdir emulador
# COPY entrypoint.sh ../emulador
WORKDIR /emulador
# RUN dos2unix -f entrypoint.sh
# RUN chmod a+x entrypoint.sh

EXPOSE 5121 6121 6900
# CMD ["bash"]