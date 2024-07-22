#!/bin/bash

steamcmd +force_install_dir /steamcmd/silica +login anonymous +app_update 2738040 validate +quit

mkdir /root/.steam/sdk64
cp /root/.steam/steam/steamcmd/linux64/steamclient.so /root/.steam/sdk64/steamclient.so

/steamcmd/silica/Silica.x86_64
