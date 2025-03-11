FROM registry.access.redhat.com/ubi9/openjdk-21-runtime

LABEL owner="UWV"

USER 0

# Log initial packages
RUN echo "Initial packages:" && rpm -qa

#
# harden environment
#
RUN mkdir /application && \
    rpm -e --nodeps --allmatches $(rpm -qa '*dnf*' '*libsolv*' '*hawkey*' '*yum*' '*python*') && \
    chgrp -R 0 /application && \
    chmod -R g=u /application

# Log packages after removal and remove RPM as well
RUN echo "Packages after hardening:" && rpm -qa &&  rpm -e --nodeps --allmatches $(rpm -qa '*rpm*')

# Switch to the non-root user
USER 1001

ENV TZ="Europe/Amsterdam"