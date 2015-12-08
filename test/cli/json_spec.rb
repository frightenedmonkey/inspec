# encoding: utf-8
# author: Stephan Renatus

require_relative 'helper'

def verify_output(output)
    o = JSON.parse(output)
    o['name'].must_equal 'complete'
    o['title'].must_equal 'complete example profile'
    o['copyright'].must_equal 'Chef Software, Inc.'
    o['maintainer'].must_equal 'Chef Software, Inc.'
    o['copyright'].must_equal 'Chef Software, Inc.'
    o['copyright_email'].must_equal 'support@chef.io'
    o['license'].must_equal 'Proprietary, All rights reserved'
    o['summary'].must_equal 'Testing stub'
    o['version'].must_equal '1.0.0'

    rulefile = o['rules']['controls/filesystem_spec.rb']
    rulefile['title'].must_equal 'Proc Filesystem Configuration'

    control = rulefile['rules']['complete/test01']
    control['title'].must_equal 'Catchy title'
    control['desc'].must_equal 'There should always be a /proc'
    control['impact'].must_equal 0.5
    control['group_title'].must_equal 'Proc Filesystem Configuration'
    control['code'].must_match /control 'test01' do/
end

describe 'inspec json' do
  it 'converts the profile in its positional argument to JSON' do
    output = run_inspec('json', 'test/unit/mock/profiles/complete-profile').stdout
    verify_output(output)
  end

  it 'supports file output' do
    tmp = Tempfile.new(['', '.json']).path
    output = run_inspec('json', 'test/unit/mock/profiles/complete-profile', '-o', tmp).stdout
    output.must_match "----> updating #{tmp}"
    verify_output(File.read(tmp))
  end

  it 'supports config via JSON input' do
    tmp = Tempfile.new(['', '.json']).path
    output = run_inspec_with_input('json', 'test/unit/mock/profiles/complete-profile', '--json-config=-', "{\"output\": \"#{tmp}\"}").stdout
    verify_output(File.read(tmp))
  end
end
