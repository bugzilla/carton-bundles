use Dockerfile;

FROM 'ubuntu:14.04';
DOCKER_ENV BUGZILLA_GIT  => 'git://github.com/dylanwh/bmo.git';

RUN qq{
    apt-key adv --keyserver ha.pool.sks-keyservers.net
                --recv-keys A4A9406876FCBD3C456770C88C718D3B5072E1F5
};

COPY "mysql.list", "/etc/apt/sources.list.d/mysql.list";

RUN qq{
    apt-get update &&
    apt-get --no-install-recommends -y install
        apache2
        build-essential
        cvs
        g++
        git
        graphviz
        libapache2-mod-perl2
        libdaemon-generic-perl
        libfile-slurp-perl
        libgd-dev
        libgmp3-dev
        libmysqlclient-dev
        libssl-dev
        mysql-client
        mysql-server
        patchutils
        pkg-config
        unzip
        wget
};

build_tarball();