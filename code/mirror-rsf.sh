#!/bin/bash

# We are the Porneia delights. We are persistent and reluctant.
# We also do not really come from outer space.
# http://porneia.free.fr

# Version: 0.2
# Time-stamp: <2012-02-20 14:25:53>

# This script replicates http://dosh.rsf.org and http://lankaenews.rsf.org
# See http://en.rsf.org/rwb-mirror-censorship-08-02-2012,41825.html
# for more details

# Released under WTFPLv2/Beer-ware License (Revision 42)

# Depends: httrack, rsync, lftp,
#          cigarettes without additives
#          and C8H10N4O2.

#### Change this variable to feet your needs
MIRROR="/mnt/data78/rsf"
WWW="$HOME/www/streisand.me"
FTP_USER="user"
FTP_PASS="password"
FTP_PORT="21"
FTP_HOST="ftpserveur.com"
FTP_PATH="/streisand.me/"

#### Ok, here we go

# Check for httrack
echo -en $(date --rfc-3339=seconds)": Checking for HTTrack..."
if [[ -z $(which httrack) ]]; then
    echo 1>&2 "Error: could not find httrack."
    echo 1>&2 $(date --rfc-3339=seconds)": Exiting. Please install httrack."
    exit 1
fi
echo "done."

# Check for lftp
echo -en $(date --rfc-3339=seconds)": Checking for lftp..."
if [[ -z $(which lftp) ]]; then
    echo 1>&2 "Error: could not find lftp."
    echo 1>&2 $(date --rfc-3339=seconds)": Exiting. Please install lftp."
    exit 1
fi
echo "done."

# Check if $WWW exist
echo -en $(date --rfc-3339=seconds)": Does $WWW exist?..."
if [[ ! -d "$WWW" ]]; then
    echo "no."
    echo -en "\nError: "$WWW" does not exist, please create this folder.\n"
    exit 1
else
    echo "yes."
fi

# Check if $MIRROR exist
echo -en $(date --rfc-3339=seconds)": Does "$MIRROR" exist?..."
if [[ ! -d "$MIRROR" ]]; then
    echo "no."
    echo -en "\nError: "$MIRROR" does not exist, please create this folder.\n"
    exit 1
else
    echo "yes."
fi

# Launching httrack
echo -en $(date --rfc-3339=seconds)": Launching httrack "
LOCKFILE="$MIRROR/hts-in_progress.lock"

[ -f "$LOCKFILE" ] && { echo "... Already running. Exiting.";exit 0; }
if [[ -d "$MIRROR/hts-cache" ]];then
    echo "for update, please fasten your seatbelt."
    PARAMS="-O $MIRROR -q -iC2 -X"
else
    echo "for the fist time, please fasten your seatbelt."
    PARAMS="http://dosh.rsf.org http://lankaenews.rsf.org -O $MIRROR -q -%v1 -r4"
fi
echo ""
httrack $PARAMS

sleep 1

# Starting rsync
echo -en "\n"$(date --rfc-3339=seconds)": Starting rsync..."
rsync --delete -rtoqu $MIRROR/dosh.rsf.org/ $WWW/doshdu.ru/
rsync --delete -rtoqu $MIRROR/lankaenews.rsf.org/ $WWW/lankaenews.com/
echo "done."

# Fixing modes
echo -en $(date --rfc-3339=seconds)": Fixing modes in "$WWW"..."
find $WWW -type d -exec chmod 755 {} \;
find $WWW -type f -exec chmod 644 {} \;
echo "done."

# Archives and md5sum
echo $(date --rfc-3339=seconds)": Building archives and md5sum..."
cd $WWW
echo -en "   * doshdu.ru.tar.gz..."
tar cf - doshdu.ru | gzip -c > doshdu.ru.tar.gz
echo "done."
echo -en "   * doshdu.ru.tar.gz.md5sum..."
md5sum doshdu.ru.tar.gz > doshdu.ru.tar.gz.md5sum
echo "done."
echo -en "   * lankaenews.com.tar.gz..."
tar cf - lankaenews.com | gzip -c > lankaenews.com.tar.gz
echo "done."
echo -en "   * lankaenews.com.tar.gz.md5sum..."
md5sum lankaenews.com.tar.gz > lankaenews.com.tar.gz.md5sum
echo "done."
cd $HOME

# Then push local copy online using lftp
# Note that you may add &quot;set ftp:list-options -a;&quot; before
# &quot;open&quot; to lftp commands in case your ftp server hide
# dot-files by default (e.g. .htaccess), and show them only when LIST
# command is used with -a command.  Please see lftp man for further
# details.
echo $(date --rfc-3339=seconds)": Local copy of "$WWW" is going to be pushed..."
lftp -c "open -u $FTP_USER,$FTP_PASS -p $FTP_PORT $FTP_HOST;
         lcd $WWW;
         cd $FTP_PATH;
         mirror --delete --reverse --verbose"
echo $(date --rfc-3339=seconds)": All done."
