###########################################################
### gen_certs.sh will generate a KEY, a CSR and self-signed
### CRT. This is designed for use with ngnx proxy
### server or equivalent. Requires openssl.
#
### an online generator can be found at
### https://regery.com/en/security/ssl-tools/self-signed-certificate-generator
#
### last updated: 29Jan2026
#
### references:
###

pipefail -eox

print "Usage: ./gen_certs.sh <domain>"
print "<domain> does not have to be a"
print "registered external domain."
print "This will set $1 as a domian for"
print "local/internal resolution."
sleep 3s

if [ "$#" -ne 1 ]; then
  echo "Error: No domain or IP address provided"
  echo "Usage: $0 <domain_or_ip>"
  exit 1
fi

DOMAIN=$1

# set the input domain as the base foe the three certs
# output the key file
openssl genrsa -out DOMAIN.me.key 2048
# generate CSR
openssl req -new -key DOMAIN.me.key -out DOMAIN.me.csr -subj "/CN=.DOMAIN.me"
# generate certificate
openssl x509 -req -in DOMAIN.me.csr -signkey DOMAIN.me.key -out DOMAIN.me.crt -days 825 -extensions v3_req -extfile
