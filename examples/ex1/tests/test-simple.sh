#!/usr/bin/env bash
##
##
# Description:
#   Simple BASH script used to run SCOUTUI.
##

setup()
{
  HOST="https://stark-bastion-95510.herokuapp.com/playground"

  CAPS="--capabilities ../../common/capabilities/win10.chrome50.json"
  CAPS="--capabilities ../capabilities/win10.ff46.json"

  USER_ID="blahblah@blahblahblah.blah"
  PASSWORD="password"
  TESTCFG=../testconfig/test.config.json


  TITLE="ScoutUI Playground"
  VIEWPORT="1024x768"
  MODEL="../appmodel/playground.model.json"
}



run()
{
  CMD=$1
#  VIEWPORT="--viewport 1024x670"
#  VIEWPORT="--viewport 1024x722"

# --sauce:platform "Windows 10" --sauce:build SmokeEx --sauce:name Smokes  --sauce:browsername "MicrosoftEdge" --sauce:browser "MS Edge 13.10586" --sauce:version "13.10586" --sauce:resolution "1280x1024" \

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


