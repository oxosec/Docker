FROM breakdowns/mega:latest

RUN apt-get -qq update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/* && \
    apt-add-repository non-free && \
    apt-get -qq update && \
    apt-get -qq install -y p7zip-full mediainfo p7zip-rar aria2 curl pv jq ffmpeg locales python3-lxml xz-utils && \
    apt-get purge -y software-properties-common

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \ 
locale-gen

ENV LANG en_US.UTF-8 \
    LANGUAGE en_US:en \
    LC_ALL en_US.UTF-8
