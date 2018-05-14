FROM alpine:latest

# Install and rehome
RUN apk add --no-cache samba-dc supervisor \
    # Remove default config data, if any
    && rm -rf /etc/samba \
    && rm -rf /var/lib/samba \
    && rm -rf /var/log/samba \
    && ln -s /samba/etc /etc/samba \
    && ln -s /samba/lib /var/lib/samba \
    && ln -s /samba/log /var/log/samba

# Persist the configuration, data and log directories
VOLUME ["/samba"]

# Copy & set entrypoint for manual access
COPY ./entrypoint.sh /
CMD ["/entrypoint.sh"]
