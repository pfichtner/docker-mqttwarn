FROM python:2.7

MAINTAINER pfichtner "https://github.com/pfichtner"

# build /opt/mqttwarn
RUN mkdir -p /opt/mqttwarn
RUN git clone https://github.com/jpmens/mqttwarn.git /opt/mqttwarn
WORKDIR /opt/mqttwarn

# install python library
RUN pip install paho-mqtt requests

# add user mqttwarn to image
RUN groupadd -r mqttwarn && useradd -r -g mqttwarn mqttwarn
RUN chown -R mqttwarn /opt/mqttwarn

# process run as mqttwarn user
USER mqttwarn

# conf file from host
VOLUME ["/opt/mqttwarn/conf"]

# set conf path
ENV MQTTWARNINI="/opt/mqttwarn/conf/mqttwarn.ini"

# run process
CMD python mqttwarn.py

