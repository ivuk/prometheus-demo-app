# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8443
  config.vm.network "forwarded_port", guest: 5000, host: 5000

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provision "prometheus", type: "ansible" do |ansible|
    ansible.playbook = "ansible/prometheus.yml"
  end
  config.vm.provision "docker", type: "ansible" do |ansible|
    ansible.playbook = "ansible/docker.yml"
  end

end
