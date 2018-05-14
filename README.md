# Samba AD

Docker container to set up Samba as an Active Directory Domain Controller

## Configuration

```cp .env.example .env```

Edit .env

## Ports

Port usage from samba docs:
* 53/tcp
* 53/udp
* 88/tcp
* 88/udp
* 135/tcp
* 137/udp
* 138/udp
* 139/tcp
* 389/tcp
* 389/udp
* 445/tcp
* 464/tcp
* 464/udp
* 636/tcp
* 49152-65535/tcp
* 3268/tcp
* 3269/tcp


Or ```net: host``` as alternative