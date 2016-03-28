#
# Kibana Dockerfile
#
# https://github.com/eliotk/docker-kibana
#

# Pull base image.
FROM dockerfile/java:oracle-java7

ENV KIBANA_VERSION kibana-4.0.1-linux-x64

# Install Kibana
RUN echo "!/bin/sh ntpdate ntp.ubuntu.com" >> /etc/cron.daily/ntpdate && \
		chmod 750 /etc/cron.daily/ntpdate && \
		cd /tmp && \
		wget https://download.elastic.co/kibana/kibana/$KIBANA_VERSION.tar.gz && \
		tar xvzf $KIBANA_VERSION.tar.gz && \
		rm -f $KIBANA_VERSION.tar.gz && \
		mv /tmp/$KIBANA_VERSION /kibana

# Mount kibana.yml config
ADD config/kibana.yml /kibana/config/kibana.yml

# Define default command.
CMD ["/kibana/bin/kibana"]

EXPOSE 5601