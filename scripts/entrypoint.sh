#!/bin/bash
set -m
export APP_PATH=/opt/app/
cd $APP_PATH
pushd hello-zero
    gcc -o zero main.c
    # echo lfs | sudo -S cp zero $APP_PATH/output
    cp zero $APP_PATH/output
    chmod -R 777 $APP_PATH/output/
popd
echo "Done!"
  
# tail -f /dev/null
# fg %1
