FROM python:3.9-slim-bullseye

ARG APPINSPECT_VERSION
ENV APPINSPECT_VERSION ${APPINSPECT_VERSION}

RUN pip install splunk-appinspect==${APPINSPECT_VERSION}
RUN apt-get update && apt-get upgrade -y && apt-get install jq libmagic1 patch -y

ADD patch.savedsearches.v3.5.0 /tmp/

RUN cd /usr/local/lib/python3.9/site-packages/splunk_appinspect/checks && patch < /tmp/patch.savedsearches.v3.5.0