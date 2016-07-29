FROM ubuntu
MAINTAINER mwaeckerlin
ENV TERM xterm

RUN apt-get update
RUN apt-get install -y ldap-account-manager
RUN sed -i 's,DocumentRoot .*,DocumentRoot /usr/share/ldap-account-manager,' /etc/apache2/sites-available/000-default.conf
CMD if test -f /run/apache2/apache2.pid; then \
      rm /run/apache2/apache2.pid; \
    fi; \
    apache2ctl -DFOREGROUND

EXPOSE 80
VOLUME /var/lib/ldap-account-manager
