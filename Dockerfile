FROM registry.access.redhat.com/ubi9/openjdk-21-runtime

LABEL owner="UWV"
LABEL team="CompetentNL"

USER root

# Harden the environment by removing unnecessary packages
RUN mkdir /application && \
    rpm -e --nodeps $(rpm -qa '*rpm*' '*dnf*' '*libsolv*' '*hawkey*' '*yum*' '*python*') && \
    chgrp -R 0 /application && \
    chmod -R g=u /application

# Switch to the non-root user
USER 1001

ENV TZ="Europe/Amsterdam"