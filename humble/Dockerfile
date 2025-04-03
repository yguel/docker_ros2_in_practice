# Copyright 2020-2023 Tiryoh<tiryoh@gmail.com>
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# This Dockerfile is based on https://github.com/AtsushiSaito/docker-ubuntu-sweb
# which is released under the Apache-2.0 license.

FROM tiryoh/ros2-desktop-vnc:humble

ARG TARGETPLATFORM
LABEL maintainer="Manuel YGUEL<yguel.robotics@gmail.com>"

SHELL ["/bin/bash", "-c"]

# Upgrade OS
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Configure locales
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        locales && \
    echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "LANG=en_US.UTF-8" > /etc/locale.conf && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.utf8 LC_ALL=en_US.utf8 && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Install wget
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        wget && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# # Get and install template2instance
RUN cd /tmp && wget --content-disposition "https://seafile.unistra.fr/f/af9e58e541c04baba959/?dl=1" && \
    apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -f -y ./template2instance_1.0_amd64.deb && \
    rm /tmp/template2instance_1.0_amd64.deb && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /
RUN dos2unix /entrypoint.sh
ENTRYPOINT [ "/bin/bash", "-c", "/entrypoint.sh" ]

ENV USER ubuntu
ENV PASSWD ubuntu