#!/bin/bash

# Time-stamp: <2012-02-10 02:54:30>

# This script is based on a version found on Wilson's Wiki
# http://168.site90.net/doku.php?id=shell-script-mirror-ftp-sites-using-lftp
# CC Attribution-Share Alike 3.0 Unported

usage() {
  echo ""
  echo "USAGE: `basename $0` <local_dir> <dst_ftp_address>"
  echo "DESCRIPTION:"
  echo "    ftp_address is in the format of ftp://user:pass@host:port/path"
  echo "    e.g. ftp://user:pass@ndd.com:21/public_html"
  echo ""
}

# lftp is required
if [[ -z `which lftp` ]]; then
  echo 1>&2 "Error: could not find lftp."
  exit 1
fi

# save current path
CWD=`pwd`

# check arguments
if [[ $# -ne 2 ]]; then
  echo 1>&2 "Error: invalid arguments."
  usage
  exit 1
fi

# local dir
LOCAL_DIR=$1


# parse dst address
s=$2
[[ $s == ftp://* ]] && s=${s:6}
s1=`echo $s | awk -F @ '{print \$1}'`
s2=`echo $s | awk -F @ '{print \$2}'`
DST_FTP_USER=`echo $s1 | awk -F : '{print \$1}'`
DST_FTP_PASS=`echo $s1 | awk -F : '{print \$2}'`
DST_FTP_HOST=`echo $s2 | awk -F : '{print \$1}'`
s3=`echo $s2 | awk -F : '{print \$2}'`
i=`expr index $s3 /`
DST_FTP_PORT=${s3:0:$((i-1))}
[[ -z $DST_FTP_PORT ]] && DST_FTP_PORT=21
DST_FTP_PATH=${s3:$((i-1))}
DST_FTP_ADDR="ftp://${FTP_HOST}:${FTP_PORT}${FTP_PATH}"

# upload from local dir to dst ftp server
echo "Uploading $LOCAL_DIR to $DST_FTP_HOST..."

# Proceed.
# Note that you may add "set ftp:list-options -a;" before "open" in
# case your ftp server hide dot-files by default (e.g. .htaccess), and
# show them only when LIST command is used with -a command.  Please
# see lftp man for further details.
lftp -c "open -u $DST_FTP_USER,$DST_FTP_PASS -p $DST_FTP_PORT $DST_FTP_HOST;
         lcd $LOCAL_DIR;
         cd $DST_FTP_PATH;
         mirror --delete --reverse --verbose"
