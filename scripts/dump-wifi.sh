#!/bin/sh
grep -v '^[[:space:]]*$' /etc/NetworkManager/system-connections/$1.nmconnection | sed 's/^/        /'
