#!/bin/bash
. /home/${USER}/dotfiles/.env

echo "Updating DuckDNS" > ./duck.log

for URL in "${DUCK_URLS[@]}"; do
  echo url="https://www.duckdns.org/update?domains=${URL}&token=${DUCK_TOKEN}&ip=" | curl -k -K - &>/dev/null
  if [ $? -eq 0 ]; then
    echo "DuckDNS: ${URL} updated" >> ./duck.log
  else
    echo "DuckDNS: ${URL} update failed" >> ./duck.log
  fi
done

