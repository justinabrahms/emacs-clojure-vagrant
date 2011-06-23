Vagrant::Config.run do |config|
  config.vm.box = "natty32"
  config.vm.box_url = "http://dl.dropbox.com/u/7490647/talifun-ubuntu-11.04-server-i386.box"
  config.vm.provision :shell, :path => "clojure_emacs.sh"
end
