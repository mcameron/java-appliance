# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define 'static' do |config|
        config.vm.provider "virtualbox" do |pv|
            pv.name = 'static'
            pv.customize ["modifyvm", :id, "--cpuexecutioncap", 25 ]
            pv.customize  ["modifyvm", :id, "--memory", 512 ]
            pv.customize ["modifyvm", :id, "--cpus", 1 ]
            pv.gui = false
            pv.memory = 512
        end
        config.vm.box = 'static'
        config.vm.box_check_update = true
        config.vm.box_url = 'http://files.vagrantup.com/precise32.box'
        config.vm.network :forwarded_port, guest: 80, host: 8882
        config.vm.network "private_network", ip: '192.168.202.10'
    end

    config.vm.define 'dynamic' do |config|
        config.vm.provider "virtualbox" do |pv|
            pv.name = 'dynamic'
            pv.customize ["modifyvm", :id, "--cpuexecutioncap", 25 ]
            pv.customize  ["modifyvm", :id, "--memory", 512 ]
            pv.customize ["modifyvm", :id, "--cpus", 1 ]
            pv.gui = false
            pv.memory = 512
        end
        config.vm.box = 'dynamic'
        config.vm.box_check_update = true
        config.vm.box_url = 'http://files.vagrantup.com/precise32.box'
        config.vm.network :forwarded_port, guest: 8080, host: 8881
        config.vm.network "private_network", ip: '192.168.202.20'
    end

    config.vm.define 'dynamic2' do |config|
        config.vm.provider "virtualbox" do |pv|
            pv.name = 'dynamic2'
            pv.customize ["modifyvm", :id, "--cpuexecutioncap", 25 ]
            pv.customize  ["modifyvm", :id, "--memory", 512 ]
            pv.customize ["modifyvm", :id, "--cpus", 1 ]
            pv.gui = false
            pv.memory = 512
        end
        config.vm.box = 'dynamic2'
        config.vm.box_check_update = true
        config.vm.box_url = 'http://files.vagrantup.com/precise32.box'
        config.vm.network :forwarded_port, guest: 8081, host: 8883
        config.vm.network "private_network", ip: '192.168.202.30'
        config.vm.provision :ansible do |ansible|
            # Disable default limit to connect to all the machines
            ansible.limit = 'all'
            ansible.playbook = "ansible/site.yml"
        end
    end
end
