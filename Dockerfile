FROM ubuntu:20.04

RUN apt update && apt install -y software-properties-common poppler-utils fonts-comfortaa culmus
RUN add-apt-repository ppa:inkscape.dev/stable &&\
  apt install -y inkscape

ARG user=inkscape
ARG INKSCAPE_HOME=/home/inkscape

RUN useradd -ms /bin/bash ${user}

COPY convert.sh $INKSCAPE_HOME

VOLUME $INKSCAPE_HOME/input
VOLUME $INKSCAPE_HOME/output

USER ${user}
WORKDIR ${INKSCAPE_HOME}
