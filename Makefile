include make-app.mk
include make-ansible.mk

create-env:
	 ansible-playbook ansible/development.yml -i ansible/development -vv -K

terraform-vars-generate:
	 ansible-playbook ansible/terraform.yml -i ansible/production -vv

production-deploy:
	ansible-playbook ansible/deploy.yml -i ansible/production -vvvv

production-setup:
	ansible-playbook ansible/site.yml -i ansible/production -vvvv
