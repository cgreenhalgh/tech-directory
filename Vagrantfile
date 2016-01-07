Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  # jekyll server 
  config.vm.network "forwarded_port", guest: 4000, host: 4000

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo apt-get update
    sudo apt-get -y install build-essential git 
    # ruby-install 
    wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
    tar -xzvf ruby-install-0.6.0.tar.gz
    cd ruby-install-0.6.0/
    sudo make install
    cd ..
    sudo ruby-install --system ruby
    sudo gem install bundler
    cd /vagrant
    # uses Gemfile!
    bundle install
    # node.js
    curl -sL https://deb.nodesource.com/setup | sudo bash -
    sudo apt-get install -y nodejs

    # rvm
    #curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -    
    #curl -sSL https://get.rvm.io | sudo bash -s stable --ruby
    # why doesn't root known rvm?
    #sudo gem install jekyll
    #sudo /usr/local/rvm/bin/rvm all do gem install jekyll

SHELL


end

