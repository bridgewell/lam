FROM ubuntu
MAINTAINER mwaeckerlin
ENV TERM xterm

RUN apt-get update
RUN apt-get install -y ldap-account-manager
CMD apache2ctl -DFOREGROUND

EXPOSE 80
VOLUME /var/lib/ldap-account-manager
