set -e

NOW=$(date +"%m-%d-%Y")
BACKUP_FILE_NAME="dokuwiki-data-backup-$NOW.tar.gz"
BACKUP_FILE_PATH="/tmp/$BACKUP_FILE_NAME"

tar zcpfv $BACKUP_FILE_PATH --exclude="/var/www/html/dokuwiki/data/cache" /var/www/html/dokuwiki/data
aws s3 cp $BACKUP_FILE_PATH s3://dokuwiki-backups/
rm $BACKUP_FILE_PATH
