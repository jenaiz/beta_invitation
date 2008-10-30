ENV['RAILS_ENV'] = 'test' 

ENV['RAILS_ROOT'] ||= File.dirname(FILE) + '/../../../..' 

require 'test/unit' 

require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb')) 

config = YAML::load(IO.read(File.dirname(FILE) + '/database.yml')) 

ActiveRecord::Base.logger = Logger.new(File.dirname(FILE) + "/debug.log") 

db_adapter = ENV['DB']