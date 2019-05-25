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
