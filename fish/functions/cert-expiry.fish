function cert-expiry --description "Show SSL/TLS certificate expiry date via curl (HEAD request)"
    if test (count $argv) -lt 1
        echo "Usage: cert-expiry DOMAIN [PORT]" >&2
        echo "Example: cert-expiry apps.goodyear.com" >&2
        return 1
    end

    set -l domain $argv[1]
    set -l port 443
    if test (count $argv) -ge 2
        set port $argv[2]
    end

    # Build URL with optional non-default port
    set -l url https://$domain
    if test "$port" != "443"
        set url https://$domain:$port
    end

    # Ask curl to perform a HEAD request and be verbose (to print TLS info to stderr).
    # We capture stderr (2>&1) and grep for the "expire date" line printed by curl.
    set -l line (curl -I -sS -v --connect-timeout 10 $url 2>&1 | grep -i "expire date" | head -n1)

    if test -z "$line"
        echo "Could not read certificate expiry from $domain:$port" >&2
        echo "Tip: The server must support HTTPS and present a certificate during the TLS handshake." >&2
        return 2
    end

    # Normalize the output by stripping the prefix.
    set -l expiry (string replace -r '.*expire date:\s*' '' -- "$line")
    echo "🔐 $domain:$port - 📅 $expiry"
end
