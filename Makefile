check:
	@ansible --version

debian:
	sudo apt update
	sudo apt install software-properties-common -y
	sudo apt-add-repository --yes --update ppa:ansible/ansible
	sudo apt install ansible -y

provisioning:
	ansible-playbook -i hosts playbook.yaml --ask-become-pass
