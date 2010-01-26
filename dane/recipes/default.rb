package "zsh"

group "admin" do
  gid 1000
end

user "djensen" do
  comment "djensen"
  uid 1000
  gid 1000
  home "/home/djensen"
  shell "/usr/bin/zsh"
  #password "$1$JJsvHslV$szsCjVEroftprNn4JHtDi."
end

directory "/home/djensen" do
  owner "djensen"
  group "admin"
  mode "0755"
  action :create
  not_if "test -d /home/djensen"
end  

mount "/home/djensen" do
  device "/dev/sdj"
  fstype "xfs"
end

directory "/home/djensen/repos" do
  owner "djensen"
  group "admin"
  mode "0755"
  action :create
  not_if "test -d /home/djensen/repos"
end

bash "clone ubuntu-rightimage-misc" do
  user "djensen"
  cwd "/home/djensen/repos"
  code <<-EOH
  git clone git://github.com/careo/ubuntu-rightimage-misc.git
  EOH
  not_if { File.exists?("/home/djensen/repos/ubuntu-rightimage-misc") }
end

bash "install zshrc" do
  user "djensen"
  cwd "/home/djensen/repos/ubuntu-rightimage-misc"
  code <<-EOH
  cp zshrc ~/.zshrc
  EOH
end

  
bash "do more stuff" do
  user "root"
  cwd "/home/djensen/repos/ubuntu-rightimage-misc"
  code <<-EOH

  # fix those "4gb seg fixup" errors
  echo 'hwcap 0 nosegneg' > /etc/ld.so.conf.d/libc6-xen.conf && ldconfig

  # setup zsh
  cp zshrc /root/.zshrc
  #sed -i /etc/passwd -e 's/root:x:0:0:root:\/root:\/bin\/bash/root:x:0:0:root:\/root:\/usr\/bin\/zsh/'
  EOH
  not_if { File.exists?("/root/.zshrc") }
end
