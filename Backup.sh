#!/usr/bin/env bash

#create folder for duplicity
mkdir /duplicity

#git clone duplicity backup
cd /duplicity && git clone https://github.com/zertrin/duplicity-backup.git
cd /duplicity/duplicity-backup && mv * ../
cd /duplicity && rm -R duplicity-backup



# check if we need to do a restore if not then check if duplicity-backup.conf exist
# if restore is yes we are going to skip al of this and restore the files.


if [ $restore -eq 0 ]; then
	if [ -f /etc/duplicity-backup.conf ] then
     	echo the config file exist we are going to start the backup
	else
    	echo the config file does not exist we are going to make it and make cron options
    #create config file
		cat >>/duplicity/duplicity-backup.conf <<EOL
		AWS_ACCESS_KEY_ID="$AWS_ACCES_KEY"
		AWS_SECRET_ACCESS_KEY="$AWS_SECRET_KEY"
		ENCRYPTION='no'
		ROOT="$Backupfolder"
		DEST="s3+http://cureosuserdata.s3.amazonaws.com/$Backupfolder"
		STATIC_OPTIONS="--full-if-older-than 14D --s3-use-new-style --s3-european-buckets"
		CLEAN_UP_TYPE="remove-all-but-n-full"
		CLEAN_UP_VARIABLE="4"
EOL
 
		#set our cronjob to make it run every x hours

	fi

else
#So the restore eq value said it's not 0 so we are going to do a restore!


fi



