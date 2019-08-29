#
# Cookbook:: logstash
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'logstash::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '16.04'

    it 'runs apt get update' do
    expect(chef_run).to update_apt_update 'update_sources'
  end

  it 'should install logstash' do
    expect(chef_run).to install_package 'logstash'
  end


  end
end
