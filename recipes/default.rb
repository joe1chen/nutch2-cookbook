# Installs nutch 2 according to http://wiki.apache.org/nutch/Nutch2Tutorial
# Customized to install from 2.x source.

# Install git
include_recipe 'git'

# Prepare config files
cookbook_file "/tmp/gora.properties" do
    source "gora.properties"
    mode "0644"
end

cookbook_file "/tmp/nutch-site.xml" do
    source "nutch-site.xml"
    mode "0644"
end

cookbook_file "/tmp/ivy.xml" do
    source "ivy.xml"
    mode "0644"
end

# Extract configure for hbase and compile
bash "install_nutch" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    git clone #{node["nutch"]["source"]["git"]["url"]}
    cd nutch
    git checkout #{node["nutch"]["source"]["git"]["branch"]}
    cp /tmp/nutch-site.xml ./conf/nutch-site.xml
    cp /tmp/gora.properties ./conf/gora.properties
    cp /tmp/ivy.xml ./ivy/ivy.xml
    ant runtime
    #copy to /opt/nutch
    cp -r /tmp/nutch /opt/nutch
    chmod g+s -R /opt/nutch/
    #create log folder
    mkdir -p /opt/nutch/runtime/local/logs/
    chmod 777 /opt/nutch/runtime/local/logs/
  EOH
  action :nothing
end

package "hadoop-0.20-conf-pseudo" do
   action :install
end
