FROM bigtruedata/php-mongodb:5-apache

COPY --chown=0:0 entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /app
ADD . /app
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN  apt-get update \
  && apt-get install -y wget git unzip vim \
  && rm -rf /var/lib/apt/lists/*
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/ba13e3fc70f1c66250d1ea7ea4911d593aa1dba5/web/installer -O - -q | php -- --quiet
RUN php composer.phar install --ignore-platform-reqs

## Get REMCO
ENV REMCO_VER=0.11.0
RUN wget https://github.com/HeavyHorst/remco/releases/download/v${REMCO_VER}/remco_${REMCO_VER}_linux_amd64.zip -P /usr/local/bin/ && \
    unzip /usr/local/bin/remco_${REMCO_VER}_linux_amd64.zip -d /usr/local/bin/ && rm /usr/local/bin/remco_${REMCO_VER}_linux_amd64.zip
COPY REMCO/ /etc/remco/

EXPOSE 8888
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]