Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.boot_timeout = 600

  config.vm.network "forwarded_port",
    guest: 8080,
    host: 8080,
    auto_correct: true

  config.vm.network "forwarded_port",
    guest: 80,
    host: 8081,
    auto_correct: true

  # Re-enable shared folder
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1536"
    vb.cpus   = 1
  end

  config.vm.provision "shell", path: "provision.sh"

end