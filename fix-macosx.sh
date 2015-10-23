#!/bin/sh

while true; do
	printf "[$$ $0] Are you sure ? "
	read -p "(Y/N): " yn
	case $yn in
		[Yy]* ) launchctl unload /System/Library/LaunchDaemons/com.apple.syslogd.plist;rm -rf /var/log/asl/*.asl /var/log/secure.lo* /var/log/system.lo* /var/log/ppp.lo* /var/log/pgpwded.lo* /var/log/kernel.lo*;killall HWPortCfg;killall HWNetCfg;killall PGP;killall PGP\ Engine;killall pgp-agent;killall PGP;killall PGPdiskEngine;killall PGPsyncEngine;killall pgpwded;defaults write com.pgp.desktop checkForUpdates 0;launchctl stop com.pgp.wde.pgpwded;launchctl stop com.pgp.framework.PGPwde;launchctl stop com.valvesoftware.steamclean;launchctl stop com.valvesoftware.steam.ipctool;iifconfig en0 ether $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//');break;;
		[Nn]* ) exit;;
		* ) ;;
	esac
done
