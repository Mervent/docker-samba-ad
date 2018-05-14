#!/bin/sh

set -e

# Initialize the AD DC
if [ ! -f /samba/etc/smb.conf ]; then
    mkdir -p /samba/etc /samba/lib /samba/log
    echo "${SAMBA_DC_DOMAIN} - Begin Domain Provisioning"
    samba-tool domain provision --domain="${SAMBA_DC_DOMAIN}" \
        --adminpass="${SAMBA_DC_ADMIN_PASSWD}" \
        --server-role=dc \
        --realm="${SAMBA_DC_REALM}" \
        --dns-backend="${SAMBA_DC_DNS_BACKEND}" \
        --use-rfc2307

    cp /var/lib/samba/private/krb5.conf /etc/krb5.conf


    echo "${SAMBA_DC_DOMAIN} - Domain Provisioned Successfully"
fi

# Fix resolv.conf to work both with Samba AD and Docker DNS
echo "" > /etc/resolv.conf
echo "domain ${SAMBA_DC_REALM}" >> /etc/resolv.conf # Samba domain
echo "nameserver 127.0.0.1" >> /etc/resolv.conf # Samba DNS
echo "nameserver 127.0.0.11" >> /etc/resolv.conf # Docker DNS

exec /usr/sbin/samba -i < /dev/null
