debian:
	@sudo apt update
	@sudo apt install software-properties-common -y
	@sudo apt-add-repository --yes --update ppa:ansible/ansible
	@sudo apt install ansible -y

provisioning:
	@ansible-playbook -i hosts playbook.yaml --ask-become-pass

resync:
	@roles/autorandr/scripts/sync
	@roles/autostart/scripts/sync
	@roles/fonts/scripts/sync
	@roles/home/scripts/sync
	@roles/ulauncher/scripts/sync
	@roles/vim/scripts/sync

restart:
	@sudo reboot
