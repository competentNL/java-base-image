FROM registry.access.redhat.com/ubi9/openjdk-21-runtime

LABEL owner="UWV"

USER 0

# Log initial packages
RUN echo "Initial packages:" && rpm -qa

# Harden the environment by removing unnecessary packages
RUN mkdir /application && \
    rpm -e --nodeps --allmatches $(rpm -qa '*dnf*' '*libsolv*' '*hawkey*' '*yum*' '*python*') && \
    chgrp -R 0 /application && \
    chmod -R g=u /application

# Log packages after removal
RUN echo "Packages after hardening:" && rpm -qa

# Remove RPM and its related packages
RUN rpm -e --nodeps --allmatches $(rpm -qa '*rpm*') && \
    # Clean up RPM caches
    rm -rf /var/cache/rpm && \
    rm -rf /var/lib/rpm/__db*

# Switch to the non-root user
USER 1001

ENV TZ="Europe/Amsterdam"