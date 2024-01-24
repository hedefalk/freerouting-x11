#!/bin/bash
Xvfb :99 &
export DISPLAY=:99
x11vnc -forever -usepw -create &
java -jar /opt/app/freerouting-1.8.0.jar $@