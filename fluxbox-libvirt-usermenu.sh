#!/bin/bash
#
# Generate a fluxbox menu for libvirt
# 
# William PC, Seattle US 2019
#

DOMAINS=$(virsh list --name --all | sort --ignore-case)

echo "[submenu] (Virtual Machines)"
echo "  [exec]   (virt-manager) {virt-manager}"
echo "[separator]"

for domain in $DOMAINS; do
  echo "[submenu] ($domain)"
  echo "[separator]"
  echo "  [exec]   (start) {virsh start $domain}"
  echo "  [exec]   (reboot) {virsh reboot $domain}"
  echo "  [exec]   (shutdown) {virsh shutdown $domain}"
  echo "[end]"
done

echo "[end]"
