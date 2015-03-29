#!/usr/bin/env bash

#create folder for duplicity
mkdir /duplicity

#git clone duplicity backup
cd /duplicity && git clone https://github.com/zertrin/duplicity-backup.git
cd /duplicity/duplicity-backup && mv * ../
cd /duplicity && rm -R duplicity-backup
chmod +x /duplicity/duplicity-backup.sh

# check if we need to do a restore if not then check if duplicity-backup.conf exist
# if restore is yes we are going to skip all of this and restore the files.
if [ $restore -eq 0 ]; then
	if [ -f /duplicity/duplicity-backup.conf ] then
     	echo the config file exist we are going to start the backup
     	#while true; do sh /duplicity/duplicity-backup.sh --backup; sleep h$hours ;done
	else
    	echo the config file does not exist we are going to make it and make cron options
    #create config file
		cat >>/duplicity/duplicity-backup.conf <<EOL
		AWS_ACCESS_KEY_ID="$AWS_ACCES_KEY"
		AWS_SECRET_ACCESS_KEY="$AWS_SECRET_KEY"
		ENCRYPTION='no'
		ROOT="$Backupfolder"
		DEST="s3+http://s3.amazonaws.com/$bucket/$Backupfolder"
		STATIC_OPTIONS="--full-if-older-than 14D --s3-use-new-style --s3-european-buckets"
		CLEAN_UP_TYPE="remove-all-but-n-full"
		CLEAN_UP_VARIABLE="4"
EOL
 
		#set our cronjob ot something to make it run every x hours
		#crontab -l > backupjob
		#echo "0 */$hours * * * sh /duplicity/duplicity-backup.sh --backup --full" >> backupjob
		#install cron job
		#crontab backupjob
		#rm backupjob
		while true; do sh /duplicity/duplicity-backup.sh --backup; sleep h$hours ; done
	fi

else
#So the restore eq value said it's not 0 so we are going to do a restore! and make a cronjob afterwarts
sh /duplicity/duplicity-backup.sh --restore $Backupfolder
fi



