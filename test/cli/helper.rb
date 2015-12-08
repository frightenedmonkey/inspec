# encoding: utf-8
# author: Stephan Renatus

require 'helper'
require 'json'
require 'mixlib/shellout'

def bin
  Gem.bin_path("inspec", "inspec")
end

def run_inspec(*args)
  inspec =  Mixlib::ShellOut.new(bin, *args)
  inspec.run_command
end

def run_inspec_with_input(*args, input)
  inspec =  Mixlib::ShellOut.new(bin, *args, input: input)
  inspec.run_command
end
