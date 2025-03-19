echo url="https://www.duckdns.org/update?domains=${PLEX_URL},${HASS_URL},${BASE_URL}&token=${DUCK_TOKEN}&ip=" | curl -k -o ./duck.log -K -
