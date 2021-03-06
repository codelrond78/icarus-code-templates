#!/bin/bash

DIR="."

git config --global user.email ${GIT_USER_EMAIL}
git config --global user.name ${GIT_USER}

cd /app

if [ "$(ls -A $DIR)" ]; then
    echo "Dir is not Empty"
else
    echo "$DIR is Empty"
    if [ -z ${REPO+x} ]; then 
        echo "No repo given"
    else 
       git clone $REPO .
       if [ -z ${BRANCH+x} ]; then 
            echo "No branch given"
        else 
           git checkout $BRANCH
    fi

    fi
fi

code-server --auth password --bind-addr 0.0.0.0:8080 /app

