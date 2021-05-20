test_launcher:
	chmod 755 launcher.sh
	sh launcher.sh

set-launcher:
	chmod 755 launcher.sh
	sed -i 's/exit 0/\ /' /etc/rc.local
	cat launcher.sh >> /etc/rc.local

check_camera:
	vcgencmd get_camera
