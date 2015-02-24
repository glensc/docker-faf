FROM fedora:21
MAINTAINER "Marek Brysa" <mbrysa@redhat.com>
ENV container docker

RUN curl -o /etc/yum.repos.d/faf.repo https://copr.fedoraproject.org/coprs/mbrysa/FAF/repo/fedora-21/mbrysa-FAF-fedora-21.repo
RUN yum -y update && yum clean all
RUN yum -y install sudo cronie httpd faf-webui2 faf-opsys-\* faf-action-\* faf-problem-\* faf-bugtracker-\* faf-migrations abrt-server && yum clean all

EXPOSE 80

ADD faf-run /usr/local/bin/faf-run
RUN chmod +x /usr/local/bin/faf-run
ADD crontab /etc/crontab
RUN crontab /etc/crontab
RUN sed -i -e"s/CreateComponents\s*=\s*False/CreateComponents = True/i" /etc/faf/faf.conf

VOLUME /var/lib/pgsql
VOLUME /var/spool/faf

CMD ["/usr/local/bin/faf-run"]