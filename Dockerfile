# ubuntu xenial dropped php5 and installs php7
# ldap-account-manager supports php7 with release 5.3
# currently (Nov16) xenial provides ldap-account-manager 5.2
FROM ubuntu:trusty
MAINTAINER mwaeckerlin
ENV TERM xterm

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y ldap-account-manager
RUN sed -i 's,DocumentRoot .*,DocumentRoot /usr/share/ldap-account-manager,' /etc/apache2/sites-available/000-default.conf

ADD start.sh /start.sh
CMD /start.sh

EXPOSE 80
VOLUME /var/lib/ldap-account-manager
