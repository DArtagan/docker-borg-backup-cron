FROM dartagan/borg-backup
MAINTAINER William Weiskopf <william@weiskopf.me>

COPY crontab /crontab.temp
RUN /usr/bin/crontab /crontab.temp

USER root

ENTRYPOINT []

CMD crond -l 0 -f

