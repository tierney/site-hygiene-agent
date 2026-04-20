#!/bin/bash

# audit-links.sh
# Usage: ./audit-links.sh <url> <pattern>

URL=$1
PATTERN=$2

if [ -z "$URL" ]; then
    echo "Usage: ./audit-links.sh <url> [pattern]"
    exit 1
fi

echo "Auditing $URL for integrity..."
if [ ! -z "$PATTERN" ]; then
    echo "Filtering for pattern: $PATTERN"
fi

# Fetch the page and find all links
links=$(curl -sL "$URL" | grep -oE 'href="([^"# ]+)"' | cut -d'"' -f2 | sort -u)

for link in $links; do
    # Handle relative links
    if [[ "$link" == /* ]]; then
        full_link="${URL%/}$link"
    elif [[ "$link" != http* ]]; then
        continue # Skip mailto, tel, etc.
    else
        full_link="$link"
    fi

    # Only audit external or patterned links to save time
    if [[ -n "$PATTERN" && "$full_link" != *"$PATTERN"* ]]; then
        continue
    fi

    # Check status
    resp=$(curl -o /dev/null -s -w "%{http_code} %{url_effective}" -L "$full_link")
    status=$(echo $resp | cut -d' ' -f1)
    effective_url=$(echo $resp | cut -d' ' -f2)

    if [ "$status" != "200" ]; then
        echo "[BROKEN] $status - $full_link"
    else
        # Check if the effective URL is different and potentially malicious
        if [ "$full_link" != "$effective_url" ]; then
            # Grab the title of the destination page
            title=$(curl -sL --max-time 5 "$effective_url" | grep -oi '<title>[^-]*</title>' | sed 's/<title>\(.*\)<\/title>/\1/i')
            
            # Check for spam keywords
            if echo "$title" | grep -Ei "togel|toto|gambling|lottery" > /dev/null; then
                echo "[ALERT] Malicious Redirect: $full_link -> $effective_url (Title: $title)"
            else
                echo "[REDIRECT] $full_link -> $effective_url"
            fi
        fi
    fi
done
