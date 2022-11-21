FROM python:3

RUN useradd -m -d /app backend

USER backend
WORKDIR /app

RUN wget -qq https://github.com/timoguic/acit4640-py-mysql/archive/refs/heads/master.zip -O /tmp/source.zip && unzip /tmp/source.zip && cp -r acit4640-py-mysql-master/backend /app/src && rm -rf acit4640-py-mysql-master

RUN python -m pip install -r /app/src/requirements.txt

WORKDIR /app/src

COPY start.sh .

RUN wget -qq https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && chmod a+x wait-for-it.sh

EXPOSE 8000

CMD ["/bin/bash", "start.sh"]
