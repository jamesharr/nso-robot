ARG PYTHON_VERSION=3.9
FROM python:$PYTHON_VERSION-slim-buster

LABEL description="Robot Framework runner in Python3"

RUN pip3 install --no-cache-dir --upgrade pip \
  && pip3 install --no-cache-dir \
    robotframework \
    robotframework-jsonlibrary \
    robotframework-requests

SHELL ["/bin/sh", "-lc"]
#ENTRYPOINT ["python3", "-m", "robot.run"]
