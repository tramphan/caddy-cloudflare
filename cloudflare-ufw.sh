#!/bin/sh

# Allow all traffic from Cloudflare IPss (no ports restriction)
# for cfip in `curl -sw '\n' https://www.cloudflare.com/ips-v{4,6}`; do ufw allow proto tcp from $cfip comment 'Cloudflare IPs'; done


# OTHER EXAMPLE RULES
# Restrict to port 80 (tcp)
#for cfip in `curl -sw '\n' https://www.cloudflare.com/ips-v{4,6}`; do ufw allow proto tcp from $cfip to any port 80 comment 'Cloudflare IPs'; done

# Restrict to port 443 (tcp & udp)
for cfip in `curl -sw '\n' https://www.cloudflare.com/ips-v{4,6}`; do ufw allow from $cfip to any port 443 comment 'Cloudflare IPs'; done

# Restrict to ports 80 & 443 (tcp)
#for cfip in `curl -sw '\n' https://www.cloudflare.com/ips-v{4,6}`; do ufw allow proto tcp from $cfip to any port 80,443 comment 'Cloudflare IPs'; done

ufw allow 22

ufw reload > /dev/null

echo "Done."