# checkov:skip=CKV_DOCKER_3 Mongo upstream doesn't care so nor do I.
FROM mongo:7.0
LABEL maintainer="Matthew Baggett <matthew@baggett.me>" \
      org.label-schema.vcs-url="https://github.com/benzine-framework/docker-mongodb" \
      org.opencontainers.image.source="https://github.com/benzine-framework/docker-mongodb"
HEALTHCHECK --interval=5s --timeout=3s --start-period=0s --retries=5 \
  CMD echo 'db.stats().ok' | mongosh --norc --quiet --host=localhost:27017
COPY mongo-init.js /docker-entrypoint-initdb.d/
