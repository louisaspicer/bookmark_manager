require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Non dustructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end
