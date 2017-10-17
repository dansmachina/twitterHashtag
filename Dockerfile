FROM python:3
LABEL maintainer="Alejandro González"
LABEL maintainer.email="alejandro.gon.per@gmail.com"
LABEL version="0.1"
ADD start.py /
RUN apt-get update
RUN apt-get upgrade -y
RUN pip install tweepy pymongo
RUN mkdir -p /config/etc && mv /etc/timezone /config/etc/ && ln -s /config/etc/timezone /etc/
RUN echo "Europe/Madrid" > /config/etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN mkdir /opt/code
ENTRYPOINT ["python", "./start.py"]