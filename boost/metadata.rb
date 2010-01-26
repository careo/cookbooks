maintainer       "Opscode, Inc."
maintainer_email "cookbooks@opscode.com"
license          "Apache 2.0"
description      "Installs libboost"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"
recipe           "boost", "Installs libboost-dev"

supports "ubuntu"

attribute "ruby_enterprise",
  :display_name => "Ruby Enterprise Edition options",
  :type => "hash"
  

attribute "ruby_enterprise/install_path",
    :display_name => "Install Path",
    :default => "/opt/ruby-enterprise"

attribute "ruby_enterprise/ruby_bin",
    :display_name =>  "Ruby bin",
    :default => "/opt/ruby-enterprise/bin/ruby"

attribute "ruby_enterprise/gems_dir",
    :display_name => "Gems Dir",
    :default => "/opt/ruby-enterprise/lib/ruby/gems/1.8"

attribute "ruby_enterprise/version",
    :display_name => "Version",
    :default => '1.8.7-2009.10'

attribute "ruby_enterprise/url",
    :display_name => "url",
    :default => "http://rubyforge.org/frs/download.php/66162/ruby-enterprise-1.8.7-2009.10"
    
