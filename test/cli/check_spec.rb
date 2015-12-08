# encoding: utf-8
# author: Stephan Renatus

require_relative 'helper'

describe 'inspec check' do
  it 'checks the profile in its positional argument' do
    out = run_inspec('check', 'test/unit/mock/profiles/complete-profile').stdout
    out.must_equal /Found 1 rules\./
  end
end
