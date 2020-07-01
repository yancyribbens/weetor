FROM debian:stable-slim

RUN apt-get update && apt-get install weechat tor apt-transport-https gpg curl -y

RUN echo "deb https://deb.torproject.org/torproject.org buster main" >> /etc/apt/sources.list
RUN echo "deb-src https://deb.torproject.org/torproject.org buster main" >> /etc/apt/sources.list

RUN curl https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -

RUN apt update
RUN apt install tor deb.torproject.org-keyring

ENTRYPOINT service tor start && weechat
