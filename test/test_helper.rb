ENV['RAILS_ENV'] = 'test' 

ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../..' 

require 'test/unit' 

require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb')) 

require 'factory_girl'
require File.expand_path(File.dirname(__FILE__) + '/factories')

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml')) 

ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log") 

#load(File.dirname(__FILE__) + '/schema.rb')

db_adapter = ENV['DB']