#!/bin/bash
. /home/${USER}/dotfiles/.env

duck_log="/home/${USER}/.duckdns/duck.log"

echo "Updating DuckDNS" > "${duck_log}"

for URL in "${DUCK_URLS[@]}"; do
  echo url="https://www.duckdns.org/update?domains=${URL}&token=${DUCK_TOKEN}&ip=" | curl -k -K - &>/dev/null
  if [ $? -eq 0 ]; then
    echo "DuckDNS: ${URL} updated" >> "${duck_log}"
  else
    echo "DuckDNS: ${URL} update failed" >> "${duck_log}"
  fi
done

