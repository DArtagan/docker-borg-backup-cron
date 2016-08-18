# docker-borg-backup-cron
 Borg: Run backups in a cron scheduled manner. A child of the dartagan/borg-backup Docker image.

 It's up to you to initialize the backup repository, set up your volumes, etc.  This package is just a borg executable and a framework for running cron.

By default, the cron will backup everything mounted at /backup_sources to a repository in /backup_repository, every day at 6:00 AM.  To override this, you'll need to make your own crontab and mount (docker run -v ...) it over the crontab in /var/spool/cron/crontabs/root.

## Getting started

You must first set up your repository with this:
```bash
$ docker run --rm --env PASSPHRASE -v /path/to/repo:/backup_repo dartagan/borg-backup-cron borg init /backup_repo
```

Start the container like this:
```bash
$ docker up --env PASSPHRASE \
    -v /etc/localtime:/etc/localtime:ro \
    -v /path/to/repo:/backup_repo \
    -v /path/to/source:/backup_source \ 
    dartagan/borg-backup-cron
```

To run a one off backup, do something like this:
```bash
$ docker run --rm --env PASSPHRASE -v /path/to/repo:/backup_repo -v /path/to/source:/backup_source dartagan/borg-backup-cron borg create --compression lz4 /backup_repo::tag /backup_source
```

Side note: no, storing a passphrase in an environment variable is a bad idea.  But secrets are proving awkward with Docker - I'm looking for a better way, if you have a tip do please send it my way.

