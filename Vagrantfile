# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  kibana_ip = "192.168.50.6"
  es_ip = "192.168.50.7"

  config.vm.box = "ubuntu/trusty64"

  config.vm.define :kibana do |kibana|
    kibana.vm.hostname = 'shell-kibana'
    kibana.vm.network "private_network", ip: "192.168.50.6"

    kibana.vm.provider "virtualbox" do |vb|
      vb.name = kibana.vm.hostname
    end

    kibana.vm.provision "shell", path: "scripts/kibana.sh",
      args: es_ip
  end

  config.vm.define :elasticsearch do |es|
    es.vm.hostname = 'shell-kibana-es'
    es.vm.network "private_network", ip: "192.168.50.7"
    es.vm.synced_folder "esdata/", "/esdata",
      owner: 'elasticsearch', group: 'elasticsearch',
      create: true

    es.vm.provider "virtualbox" do |vb|
      vb.name = es.vm.hostname
    end

    es.vm.provision "shell", path: "scripts/elasticsearch.sh"
  end

end
