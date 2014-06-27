name              "nutch2"
maintainer        "Timo Schmidt, Joe Chen"
description       "Installs Nutch 2 on cloudera 4"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0.1"

depends "cloudera"
depends "ant"
depends "java"
depends "git"

recipe "nutch2", "Installs nutch 2 on cloudera"

%w{ ubuntu }.each do |os|
  supports os
end
