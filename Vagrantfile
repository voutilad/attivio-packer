# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "attivio-5"

  config.vm.network "forwarded_port", guest: 16999, host: 16999
  config.vm.network "forwarded_port", guest: 17000, host: 17000
  config.vm.network "forwarded_port", guest: 17001, host: 17001
  config.vm.network "forwarded_port", guest: 17013, host: 17013

  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = false
     # Customize the amount of memory on the VM:
     vb.memory = "8192"
     vb.name = "attivio-5"
  end

  # X11 forwarding
  config.ssh.forward_x11 = true

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
