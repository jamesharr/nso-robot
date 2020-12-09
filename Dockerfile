FROM debian:buster
#ARG ENV_VAR

RUN apt-get update \
  && apt-get install -qy \
     python3-pip \
     python3-venv \
  && apt-get -qy autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /root/.cache

COPY requirements.txt /
RUN pip3 install -r /requirements.txt && rm requirements.txt

SHELL ["/bin/sh", "-lc"]
CMD [ "robot", "-d", "/robot-logs", "/robot" ]

#  && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 3 \
#  && update-alternatives --install /usr/bin/python python /usr/bin/python3.7 3 \
#  && update-alternatives --install /usr/bin/pylint pylint /usr/bin/pylint3 1 \

# FROM deb_base as base
# COPY extra-files/ /
# COPY --from=build_step /foo /foo
# EXPOSE 22 80 443
