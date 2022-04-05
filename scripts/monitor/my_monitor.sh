#!/bin/bash

cron="$(sha1sum /etc/crontab | awk '{print $1}')"
backup="$(cat /home/altikka/workspace/misc/cron_backup)"

echo ${cron}
echo ${backup}

if [ "$cron" != "$backup"]
then
	sha1sum /etc/crontab | awk '{print $1}' > /home/altikka/workspace/misc/cron_backup
	echo "KO"
fi
