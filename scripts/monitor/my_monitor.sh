#!/bin/bash

cron="$(sha1sum /etc/crontab | awk '{print $1}')"
backup="$(cat /home/revi/misc/cron_backup)"

echo ${cron}
echo ${backup}

if [ "$cron" != "$backup" ]
then
	sha1sum /etc/crontab | awk '{print $1}' > /home/revi/misc/cron_backup
	echo "KO" | mail -s "Cron has been compromised" root@debian.lan
fi
