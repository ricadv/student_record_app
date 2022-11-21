FROM nginx

RUN  apt-get update -y \
  && apt-get install -y wget \
  && apt-get install -y unzip \
  && rm -rf /var/lib/apt/lists/*

#RUN mkdir /frontend
WORKDIR /frontend

RUN wget -qq https://github.com/timoguic/acit4640-py-mysql/archive/refs/heads/master.zip -O /tmp/source.zip \
 && unzip /tmp/source.zip \
 && cp -r acit4640-py-mysql-master/frontend / \
 && rm -rf acit4640-py-mysql-master

RUN mkdir /etc/nginx/templates
COPY default.conf.template /etc/nginx/templates

EXPOSE 8000
