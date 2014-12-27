#!/bin/sh
date
function run() {
	IS_AVAILABLE=0
	while [ $IS_AVAILABLE -eq 0 ]
	do
		IS_AVAILABLE=`curl http://www.motorola.com/us/consumers/nexus-6-header/Nexus-6/nexus-6-motorola-us.html --no-keepalive -s | grep -i -m1 "00637NARTL\":{[^}]\\+availability\":\"IN_STOCK" | wc -l`
		if [ $IS_AVAILABLE -gt 0 ]; then
			echo "64GB CW AVAILABLE!"
			osascript -e 'display notification "MAKE IT HAPPEN - AVAILABLE" with title "NEXUS"'
			open "https://www.motorola.com/on/demandware.store/Sites-Motorola_US-Site/en_US/CART_SVC_AddToCart-Service?pid=00637NARTL&showCart=1&qty=1"
			break;
		fi
		sleep 2
	done
}
time run
