FROM python:3.9-slim-bullseye

# Set environment variables (optional)
ENV USER=appinspect
ENV UID=1000
ENV GID=1000

# Create a group and user
RUN addgroup --gid "$GID" "$USER" \
    && adduser --disabled-password --gecos "" --uid "$UID" --gid "$GID" "$USER"


RUN pip install splunk-appinspect==3.5.0
RUN apt-get update && apt-get upgrade -y && apt-get install jq libmagic1 patch -y

ADD patch.savedsearches.v3.5.0 /tmp/

RUN cd /usr/local/lib/python3.9/site-packages/splunk_appinspect/checks && patch < /tmp/patch.savedsearches.v3.5.0

WORKDIR /app

USER appinspect