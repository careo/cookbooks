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


bash "do stuff" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  # fix those "4gb seg fixup" errors
  echo 'hwcap 0 nosegneg' > /etc/ld.so.conf.d/libc6-xen.conf && ldconfig


  mkdir /opt/repos
  cd /opt/repos
  git clone git://github.com/careo/ubuntu-rightimage-misc.git
  cd /opt/repos/ubuntu-rightimage-misc

  # add sources
  #cat sources.list >> /etc/apt/sources.list
  apt-get update

  # setup zsh
  cp zshrc ~/.zshrc
  sed -i /etc/passwd -e 's/root:x:0:0:root:\/root:\/bin\/bash/root:x:0:0:root:\/root:\/usr\/bin\/zsh/'
  EOH
end


