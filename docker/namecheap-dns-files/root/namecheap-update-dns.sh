#!/bin/ash -l

# Shell script to update namecheap.com dynamic dns as required
# for a domain to your external IP address

#Required env variables:
#SUBDOMAIN - subdomain
#DOMAIN - subdomain
#PASSWORD - namecheap password for dynamic dns

if [[ -z "$SUBDOMAIN" ]]; then
    echo "SUBDOMAIN is not set. Required env vars: SUBDOMAIN, DOMAIN, PASSWORD"
    exit 1
fi
if [[ -z "$DOMAIN" ]]; then
    echo "DOMAIN is not set. Required env vars: SUBDOMAIN, DOMAIN, PASSWORD"
    exit 1
fi
if [[ -z "$PASSWORD" ]]; then
    echo "PASSWORD is not set. Required env vars: SUBDOMAIN, DOMAIN, PASSWORD"
    exit 1
fi



CURRENT_IP=$(curl ifconfig.io)
DYN_IP=$( host "$HOSTNAME.$DOMAIN" | sed -e "s/.*\ //" )

echo "CURRENT_IP: $CURRENT_IP DYN_IP: $DYN_IP"

if [ "$DYN_IP" != "$CURRENT_IP" ]; then
    echo "Updating IP for $SUBDOMAIN.$DOMAIN from $DYN_IP to $CURRENT_IP"
    curl "https://dynamicdns.park-your-domain.com/update?host=$SUBDOMAIN&domain=$DOMAIN&password=$PASSWORD"

fi