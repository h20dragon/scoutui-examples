#!/usr/bin/env bash
##
# Author: h20dragon
# 01/2017
# https://github.com/h20dragon/scoutui-examples/blob/master/README.md
##
# Description:
#   Simple BASH script used to run SCOUTUI.
##
setup()
{
  HOST="https://stark-bastion-95510.herokuapp.com/playground"

  CAPS="--capabilities ../../common/capabilities/win10.chrome50.json"

  USER_ID="blahblah@blahblahblah.blah"
  PASSWORD="password"
  TESTCFG=../testconfig/test.config.json


  TITLE="ScoutUI Playground"
  VIEWPORT="1024x768"
  MODEL="../appmodel/playground.model.json"

  if [[ -z $SCOUTUI_BIN ]]; then
    echo "Please set environment variable SCOUTUI_BIN to the Gem path to scoutui installation (e.g. bin/scoutui_driver.rb)"
    echo "Example of setting your SCOUTUI_BIN environment variable:"
    echo "     export SCOUTUI_BIN=/Users/elvis/.rvm/gems/ruby-2.30/gems/scoutui-x.x.x.x/bin/scoutui_driver.rb"
    exit 1
  fi
}



run()
{
  CMD=$1

  ruby $SCOUTUI_BIN  \
       --browser chrome \
       --config ${TESTCFG} \
       --user ${USER_ID} --password ${PASSWORD} \
       --role qa \
       --pages "${MODEL}" \
       --eyes:run false \
            --eyes:viewport 1024x722 \
            --eyes:app "Simple" \
            --eyes:title "Simple" \
       --sauce:run false \
            --sauce:platform "Windows 10" \
            --sauce:build SmokeEx \
            --sauce:name Smokes \
            --sauce:browser "chrome" \
            --sauce:version "beta" \
            --sauce:resolution "1280x1024" \
       --host ${HOST} \
       --failfast true \
       --debug \
       --dut "${CMD}"
}


setup
run "../commands/simple.yml"


