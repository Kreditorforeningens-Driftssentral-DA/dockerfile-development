FROM ubuntu:18.04

RUN apt-get -qq update && \
    apt-get -qqy install gnupg2 locales && \
    locale-gen en_US.UTF-8 && \
    locale-gen nb_NO && \
    rm -rf /var/lib/apt/lists/*

ENV TZ=Europe/Oslo \
    LANG=nb_NO \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

#
# Pull Zulu OpenJDK binaries from official repository:
#
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9 && \
    echo "deb http://repos.azulsystems.com/ubuntu stable main" >> /etc/apt/sources.list.d/zulu.list && \
    ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime && \
    apt-get -qq update && \
    apt-get -qqy install tzdata zulu-11=11.33+15 && \
    rm -rf /var/lib/apt/lists/* && \
    dpkg-reconfigure -f noninteractive tzdata
