#!/bin/bash

cd $(dirname $0) || exit


function onCtrlC () {
    #echo 'child pid is ', $!
    kill -9 $!
    exit
}
trap 'onCtrlC' INT


function a() {
    while true; do
        echo "Hello"
        sleep 1
    done
}

a &


function b() {
    while true; do
        echo "World"
        sleep 1
    done
}

b



