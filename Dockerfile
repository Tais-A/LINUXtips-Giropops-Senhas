FROM python:3.8-alpine 

LABEL version="1.0"
RUN apk update
WORKDIR giropops-senhas/
COPY ./giropops-senhas ./
RUN pip install --no-cache-dir -r requirements.txt

RUN apk add redis
COPY start-redis.sh /start-redis.sh
RUN chmod +x /start-redis.sh

ENTRYPOINT ["/start-redis.sh"]


