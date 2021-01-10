FROM mariadb:10
# Copy healthcheck file.
COPY health.sh /usr/bin/healthcheck
# Add healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
  CMD /usr/bin/healthcheck