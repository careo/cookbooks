maintainer       "Dane Jensen"
maintainer_email "dane@rightscale.com"
license          "Apache 2.0"
description      "Installs/Configures Misc Crap for Dane"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

%w{ zsh }.each do |cb|
  depends cb
end
