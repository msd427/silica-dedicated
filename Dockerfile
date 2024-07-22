FROM ubuntu:latest
RUN apt-get update

WORKDIR /steamcmd

RUN dpkg --add-architecture i386 \
  && apt-get update -y && apt-get install wget lib32gcc-s1 lib32stdc++6 \
  curl libstdc++6:i386 lib32z1 tzdata vim -y

RUN echo steam steam/question select "I AGREE" | debconf-set-selections
RUN echo steam steam/license note '' | debconf-set-selections

RUN mkdir steamcmd && mkdir game_files && apt-get install -y --no-install-recommends steamcmd

RUN ln -s /usr/games/steamcmd /usr/bin/steamcmd

RUN steamcmd +quit

RUN mkdir /root/Silica
COPY dl_gameserver.bash /steamcmd/entrypoint.bash

RUN chmod +x /steamcmd/entrypoint.bash
RUN echo 'America/New_York' > /etc/timezone

ENTRYPOINT [ "/steamcmd/entrypoint.bash" ]
