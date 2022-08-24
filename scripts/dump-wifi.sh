#!/bin/sh
grep -v '^[[:space:]]*$' /etc/NetworkManager/system-connections/$1.nmconnection | sed 's/^/        /' | sed "1 s/^/    $1: |\n/"
echo "---"
echo "  sops.secrets.\"wifi/$1\" = {"
echo "    owner = \"root\";"
echo "    path = \"/etc/NetworkManager/system-connections/$1.nmconnection\";"
echo "  };"
