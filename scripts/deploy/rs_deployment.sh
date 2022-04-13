#!/bin/bash

diff=$(diff ~/deploy/to_deploy.html /var/www/html/index.html)

if [ "$diff" != "" ]
then
	cat /var/www/html/index.html > /home/revi/misc/backup.html
	cp ~/deploy/to_deploy.html /var/www/html/index.html
	echo "Changes in index.html detected."
	echo "Deploying new version and notifying admin."
	echo "New version successfully deployed." | mail -s "Deployment complete" root@debian.lan
fi
