# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "landregistry/centos-beta"
  config.vm.network "private_network", :ip => "172.16.42.42"


  config.vm.provision :shell, :path => 'provision.sh'

    config.vm.provider :virtualbox do |vb|
      vb.name = "landregistry-development-centos2"
      vb.customize ['modifyvm', :id, '--memory', ENV['VM_MEMORY'] || 3072]
      vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
      vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
      vb.customize ["modifyvm", :id, "--cpus", ENV['VM_CPUS'] || 4]
    end

end
