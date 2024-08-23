# dynamic-dns-updater

Namecheap implementation of dynamic DNS updater.

Required env vars: SUBDOMAIN, DOMAIN, PASSWORD

I will send an update dns request to Namecheap every 5 minutes.

Resulting dns record: SUBDOMAIN.DOMAIN -> current public IP

PASSWORD is the ddns password you set in Namecheap.