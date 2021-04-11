#!/bin/bash

echo "Formart file"
dos2unix -f configure
dos2unix -f sysinfogen.sh
dos2unix -f athena-start
dos2unix -f function.sh
echo "Giving permissions"
chmod a+x /*.sh
chmod a+x athena-start
chmod a+x configure
chmod a+x login-server
chmod a+x char-server
chmod a+x map-server
chmod a+x function.sh
echo "Stop the server if it is started"
./athena-start stop
echo "Finally compile Emulator"
./configure --enable-packetver=20141022 && make clean && make server
echo "Start server"
./athena-start start
echo "SUCESSOOOOOOOO !!!!!!!!!!!!!"