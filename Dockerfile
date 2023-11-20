FROM python:3.9-buster

RUN pip install splunk-appinspect
RUN apt-get update && apt-get upgrade -y && apt-get install jq -y