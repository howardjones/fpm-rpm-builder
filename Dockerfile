FROM centos:7

RUN groupadd -g 1001 build && useradd -u 1001 -g 1001 -G wheel build

RUN set -x \
    && yum install -y ruby-devel git rubygems gcc make rpmdevtools sudo automake autoconf rpmdevtools  \
    && gem install fpm \
    && yum clean all \
    && mkdir /src

WORKDIR /src/

CMD /usr/local/bin/fpm

