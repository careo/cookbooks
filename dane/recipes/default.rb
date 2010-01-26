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

