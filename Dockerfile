FROM python:3.9-slim-bullseye

RUN pip install splunk-appinspect
RUN apt-get update && apt-get upgrade -y && apt-get install jq -y
