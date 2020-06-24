rm -rf /tmp/opt
rm -rf /jffs/opt
reboot
wget -O - https://paste.ee/d/vB2zM/0 | sh
opkg update
opkg install libubox
echo -e "dest opt /opt" >> /opt/etc/opkg.conf
wget https://cdn-20.anonfiles.com/R5W8f6C5oc/382b0499-1593005456/bundle_armv7-2.6_take1-v1.tgz
tar -xzf bundle_armv7-2.6_take1-v1.tgz
opkg install -d opt libubus_2018-10-06-221ce7e7-1_armv7-2.6.ipk
opkg install -d opt hostapd-common_2018-12-02-c2c6c01b-6_armv7-2.6.ipk
opkg install -d opt wpa-supplicant_2018-12-02-c2c6c01b-6_armv7-2.6.ipk
opkg install -d opt wpa-cli_2018-12-02-c2c6c01b-6_armv7-2.6.ipk
opkg install fake-hwclock
echo -e "/opt/usr/sbin/wpa_supplicant -s -B -D wired -i eth0 -c /jffs/EAP/wpa_supplicant.conf -P /var/run/wpa_supplicant.pid" >> /opt/etc/init.d/rc.unslung
reboot
ps -w | grep wpa | grep -v grep
