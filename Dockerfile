FROM registry.access.redhat.com/ubi9/openjdk-21-runtime

LABEL owner="UWV"
LABEL tbd-required-label="tbd-required-value"

USER 0

# Harden the environment by removing unnecessary packages
RUN mkdir /application && \
    rpm -e --nodeps $(rpm -qa '*rpm*' '*dnf*' '*libsolv*' '*hawkey*' '*yum*' '*python*' '*libarchive*' '*krb5*' '*cups-libs*') && \
    chgrp -R 0 /application && \
    chmod -R g=u /application

# Switch to the non-root user
USER 1001

ENV TZ="Europe/Amsterdam"