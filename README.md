# prometheus-demo-app
Demo repository with Prometheus and a simple Flask application

## Getting Started

Clone the project, add an entry to ansible/files/htpasswd, and start the VM via Vagrant.

### Starting the VM
```bash
cd prometheus-demo-app
htpasswd -c ansible/files/htpasswd admin
vagrant up
```

### Running the setup on Digital Ocean
1. Get an API key via DO web interface
2. Get your SSH key ID (if you don't have one associated with your account, add it via the DO web interface)
```bash
curl -X GET -H 'Content-Type: application/json' -H 'Authorization: Bearer $TOKEN' "https://api.digitalocean.com/v2/account/keys"
```
3. Fill in the `do_api_key` and `do_ssh_key_id` variables in ansible/droplet.yml
4. Run the droplet creation playbook
```bash
cd ansible
ansible-playbook -i do-inventory droplet.yml
```
5. Get the IP address of the droplet (shown at the end of the playbook run)
6. Add a user to the ansible/files/htpasswd file so you can log into Prometheus
```bash
htpasswd -c ansible/files/htpasswd admin
```
7. Run the Prometheus playbook
```bash
ansible-playbook -i '$DOIPADDRESS,' -u root prometheus.yml
```
8. Check the web interface, NGINX should be running on ports 80 and 443 (HTTPS uses self-signed certificate)
9. (Optional) if used in combination with flask-demo-app, update the `prom_target_host` variable in ansible/prometheus.yml to point to your app
