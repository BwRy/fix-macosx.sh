#!/bin/sh

while true; do
	printf "[$$ $0] Are you sure ? "
	read -p "(Y/N): " yn
	case $yn in
		[Yy]* ) launchctl unload /System/Library/LaunchDaemons/com.apple.syslogd.plist;rm -rf /var/log/asl/*.asl;rm -rf /var/log/secure.lo*;rm -rf /var/log/system.lo*;rm -rf /var/log/ppp.lo*;ifconfig en0 ether $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//');break;;
		[Nn]* ) exit;;
		* ) ;;
	esac
done
