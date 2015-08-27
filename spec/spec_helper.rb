ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

# Shoulda::Matchers.configure do |config|
#   config.integrate do |with|
#     with.test_framework(:rspec)
#     with.library(:rails)
#   end
# end

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
