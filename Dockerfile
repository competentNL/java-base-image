FROM registry.access.redhat.com/ubi9/openjdk-21-runtime

LABEL owner="UWV"
LABEL tbd-required-label="tbd-required-value"

USER root

# Harden the environment by removing unnecessary packages
RUN rpm -e --nodeps $(rpm -qa '*rpm*' '*dnf*' '*libsolv*' '*hawkey*' '*yum*' '*python*')

# Switch to the non-root user
USER 1001

ENV TZ="Europe/Amsterdam"