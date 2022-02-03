FROM centos:latest
ENV LANG=en_US.utf8
RUN echo "$LANG UTF-8" >> /etc/locale.gen
RUN yum -y update && yum clean all

RUN yum -y install glibc-langpack-en
RUN yum -y install dos2unix
RUN yum -y update && yum clean all
RUN dnf -y group install "Development Tools"
RUN dnf -y install gcc-c++ gcc make
RUN dnf -y install mariadb
RUN dnf -y install mariadb-devel
RUN dnf -y install mariadb-server 
RUN dnf -y install pcre-devel zlib-devel git
RUN dnf -y install subversion
RUN dnf -y install gdb nano vim
RUN yum -y update && yum clean all
RUN yum -y install firewalld
RUN yum -y install nodejs
RUN npm install wsproxy -g
# ---- File Emulador ---- #
WORKDIR /emulador
# RUN dos2unix -f entrypoint.sh
# RUN chmod a+x entrypoint.sh

EXPOSE 5121 6121 6900 5999
CMD [ "/bin/bash"]