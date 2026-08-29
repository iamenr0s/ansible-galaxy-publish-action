# hadolint ignore=DL3007
FROM python:latest

# Originally created by L3D <l3d@c3woc.de>
LABEL "maintainer"="iamenr0s <enros@pm.me>"
LABEL "repository"="https://github.com/iamenr0s/ansible-galaxy-publish-action.git"
LABEL "homepage"="https://github.com/iamenr0s/ansible-galaxy-publish-action"

# hadolint ignore=DL3008,DL3013,SC1091
RUN pip3 install --no-cache-dir ansible

COPY ansible_docker.py /ansible_docker.py
CMD [ "/usr/local/bin/python3", "/ansible_docker.py" ]
