# encoding: utf-8
# author: Stephan Renatus

require_relative 'helper'

# NOTE(sr) these specs' outputs depend on the OS, please try to write them
#          in a way that is OS-independent

describe 'inspec detect' do
  it 'always outputs JSON' do
    o = JSON.parse(run_inspec('detect').stdout)

    o['name'].wont_be_empty
    o['family'].wont_be_empty
    o['release'].wont_be_empty
    # o['arch'].wont_be_empty # nil/null on OSX
  end
end
