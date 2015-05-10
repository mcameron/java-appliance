# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

boxes = [{
    :name => 'dynamic',
    :box => 'dynamic',
    :box_url => 'http://files.vagrantup.com/precise32.box',
    :ip => '192.168.202.20',
    :autostart => 'true',
    :ssh_port => 2210,
    :cpus => 1,
    :cpu_percentage => 25,
    :memory => 512,
    :network  => 'public_network',
    :Controller => 'SATA Controller',
    :playbook => 'dynamic.yml',
    :from_port => 8881,
    :to_port => 8080
  },
  {
    :name => 'static',
    :box => 'static',
    :box_url => 'http://files.vagrantup.com/precise32.box',
    :autostart => 'true',
    :ip => '192.168.202.10',
    :ssh_port => 2220,
    :cpus => 1,
    :cpu_percentage => 25,
    :memory => 512,
    :network  => 'public_network',
    :Controller => 'SATA Controller',
    :playbook => 'static.yml',
    :from_port => 8882,
    :to_port => 80
  }
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    boxes.each do |box|
        config.vm.define box[:name] do |config|
            config.vm.provider "virtualbox" do |pv|
                pv.name = box[:name]
                pv.customize ["modifyvm", :id, "--cpuexecutioncap", box[:cpu_percentage] ]
                pv.customize  ["modifyvm", :id, "--memory", box[:memory] ]
                pv.customize ["modifyvm", :id, "--cpus", box[:cpus] ] if box[:cpus]
                pv.gui = false
                pv.memory = box[:memory]
            end
            config.vm.box = box[:box]
            config.vm.box_check_update = true
            config.vm.box_url = box[:box_url] if box[:box_url]
            config.vm.network "forwarded_port", guest: box[:to_port], host: box[:from_port]
            config.vm.network "private_network", ip: box[:ip]
            config.vm.share_folder  "stuff", "/usr/local/stuff", "~/Projects/stuff", :nfs => true if box[:shares]
            config.vm.provision :ansible do |ansible|
                ansible.verbose = "v"
                ansible.sudo = true
                ansible.playbook = box[:playbook]
            end
        end
    end
end
