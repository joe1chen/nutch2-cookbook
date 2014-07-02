name              "nutch2"
maintainer        "Timo Schmidt, Joe Chen"
description       "Installs Nutch 2"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.2"

depends "ant"
depends "java"
depends "git"

recipe "nutch2", "Installs nutch 2"

%w{ ubuntu }.each do |os|
  supports os
end
