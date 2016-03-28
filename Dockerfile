FROM ubuntu:14.04
MAINTAINER cason "251957448@qq.com"

RUN sudo apt-get install curl openssh-server ca-certificates postfix
RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
RUN sudo apt-get install gitlab-ce
RUN sudo gitlab-ctl reconfigure


### main
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["/bin/bash", "/start.sh"]

EXPOSE 22
EXPOSE 80
