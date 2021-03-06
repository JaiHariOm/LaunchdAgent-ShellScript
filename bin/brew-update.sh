#!/bin/sh

launchctl setenv PATH /usr/local/bin:$PATH
log_dir=$HOME/Library/Logs/Homebrew/update
log_name=${log_dir}/`date "+%Y%m%d"`.log

if [ ! -d ${log_dir} ]; then
  mkdir -p ${log_dir}
fi

brew doctor >> ${log_name} 2>&1
if [ $? -eq 0 ]; then
    brew file update >> ${log_name} 2>&1
    brew file cask_upgrade -C >> ${log_name} 2>&1
fi

#[brew-update.sh]

#Copyright (c) 2016 JaiHariOm (Hayashi Sakihara)

#This software is released under the MIT License.
#http://opensource.org/licenses/mit-license.php
