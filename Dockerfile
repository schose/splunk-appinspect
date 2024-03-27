FROM python:3.9-slim-bullseye

RUN pip install splunk-appinspect==3.5.0
RUN apt-get update && apt-get upgrade -y && apt-get install jq libmagic1 patch -y

ADD patch.savedsearches.v3.5.0 /tmp/

RUN cd /usr/local/lib/python3.9/site-packages/splunk_appinspect/checks && patch < /tmp/patch.savedsearches.v3.5.0