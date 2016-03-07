FROM ubuntu
MAINTAINER mwaeckerlin
ENV TERM xterm

RUN apt-get update
RUN apt-get install -y ldap-account-manager

CMD apache2ctl -DFOREGROUND
