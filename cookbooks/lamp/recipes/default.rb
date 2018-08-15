#
# Cookbook:: lamp
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
execute "set linker" do
  command 'update-alternatives --install "/usr/bin/ld" "ld" "/usr/bin/ld.gold" 20; update-alternatives --install "/usr/bin/ld" "ld" "/usr/bin/ld.bfd" 10; update-alternatives --config ld'
end

apt_update 'daily' do
  frequency 86_400
  action :periodic
end

include_recipe 'lamp::web'
include_recipe 'lamp::database'