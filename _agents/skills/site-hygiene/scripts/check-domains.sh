#!/bin/bash

# check-domains.sh
# Usage: ./check-domains.sh <domain>

DOMAIN=$1

if [ -z "$DOMAIN" ]; then
    echo "Usage: ./check-domains.sh <domain>"
    exit 1
fi

echo "Checking status for $DOMAIN..."

# Use whois to check if the domain is registered
# Note: Output varies by registrar, but we look for common "not found" or "Available" strings
whois_info=$(whois "$DOMAIN" | grep -Ei "No match|NOT FOUND|Available|free")

if [ -n "$whois_info" ]; then
    echo "[SAFE] $DOMAIN is available for registration."
else
    # If registered, check where it points
    ip=$(dig +short "$DOMAIN")
    echo "[WARNING] $DOMAIN is registered and points to IP: $ip"
    
    # Check if it has an A record
    if [ -z "$ip" ]; then
        echo "[INFO] No A record found for $DOMAIN."
    else
        # Try to detect malicious redirect
        title=$(curl -sL --max-time 5 "$DOMAIN" | grep -oi '<title>[^-]*</title>' | sed 's/<title>\(.*\)<\/title>/\1/i')
        echo "[TITLE] $title"
        
        # Check for common spam keywords (simulated)
        if echo "$title" | grep -Ei "toto|togel|lottery|gambling" > /dev/null; then
            echo "[ALERT] Potential malicious redirect detected on $DOMAIN!"
        fi
    fi
fi
