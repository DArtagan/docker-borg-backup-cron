FROM dartagan/borg-backup
MAINTAINER William Weiskopf <william@weiskopf.me>

COPY crontab /var/spool/cron/crontabs/root

USER root

ENTRYPOINT []

CMD crond -l 0 -f

