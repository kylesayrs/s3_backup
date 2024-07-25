set -e
if [ "$(id -u)" -ne 0 ]; then
   echo "This script must be run as root. Exiting."
   exit 1
fi

BACKUP_SCRIPT_PATH="/usr/local/bin/backup.sh"
cp backup.sh $BACKUP_SCRIPT_PATH
echo "0 0 * * 0 $BACKUP_SCRIPT_PATH" | crontab
