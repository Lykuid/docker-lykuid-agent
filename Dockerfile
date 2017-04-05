FROM datadog/docker-dd-agent

MAINTAINER David Maust <david@lykuid.com>

COPY entrypoint.sh /entrypoint.sh

# Install the generic certificates
RUN apt-get update && apt-get -y install ca-certificates curl && apt-get clean
# Add thoses certificates to datadog agent
RUN echo "ca_certs: /etc/ssl/certs/ca-certificates.crt" >> /etc/dd-agent/datadog.conf

# Use lykuid url by default
ENV DD_URL https://api.lykuid.com
