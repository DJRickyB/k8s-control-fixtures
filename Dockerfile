FROM bash:5.2.9
USER root
ADD src/scripts/ /scripts

CMD bash /scripts/run.sh
