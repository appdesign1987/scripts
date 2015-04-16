
#fix to get pure-ftpd working

# install package building helpers
RUN apt-get -y --force-yes install dpkg-dev debhelper

# install dependancies
RUN apt-get -y build-dep pure-ftpd

# build from source
RUN mkdir /tmp/pure-ftpd/ && \
    cd /tmp/pure-ftpd/ && \
    apt-get source pure-ftpd && \
    cd pure-ftpd-* && \
    sed -i '/^optflags=/ s/$/ --without-capabilities/g' ./debian/rules && \
    dpkg-buildpackage -b -uc
    
# install the new deb files
RUN dpkg -i /tmp/pure-ftpd/pure-ftpd-common*.deb
RUN apt-get -y install openbsd-inetd
RUN dpkg -i /tmp/pure-ftpd/pure-ftpd_*.deb

# Prevent pure-ftpd upgrading
RUN apt-mark hold pure-ftpd pure-ftpd-common

#install Ajenti the control panel
RUN apt-get -y install ajenti-v ajenti-v-mail ajenti-v-ftp-pureftpd ajenti-v-php-fpm ajenti-v-nginx ajenti-v-mysql
