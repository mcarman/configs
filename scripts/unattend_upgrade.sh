#!/bin/env bash
#---------------------------------------------------------------------
# name: unattend_upgrade.sh
# purpose: this will update and upgrade the computer, forcing all
# but critical errors. makes use of DEBFRONTEND and NEEDRESTART_MODE
# ref: https://www.cyberciti.biz/faq/explain-debian_frontend-apt-get-variable-for-ubuntu-debian/
# updated: 2026-05-30
# -------------------------------------------------------------------

set -eox pipefail

export NEEDRESTART_MODE=a
export DEBIAN_FRONTEND=noninteractive
## Questions that you really, really need to see (or else). ##
export DEBIAN_PRIORITY=critical
apt-get -qy clean
apt-get -qy update
apt-get -qy -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" upgrade

echo "Upgraded"
