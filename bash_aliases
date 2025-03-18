alias suod='sudo'
alias wifiConnect='sudo wpa_supplicant -i wlp2s0 -c /etc/wpa_supplicant.conf -B && sudo dhclient'
alias updog='sudo apt update && sudo apt upgrade -y'
alias musicDirCleanup='find ./ -type f -not -name "*.m4a" -not -name "*.lrc" -not -name "*.jpg" -not -name "*.txt" -not -name "*.mp3" -not -name "*.pdf" -not -name "*.m4v" -not -name "*.png" -not -name "*.plexignore" -not -name "*.flac" -delete'
