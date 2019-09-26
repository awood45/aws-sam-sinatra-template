require 'rack'
require 'rack/contrib'
require_relative './server'

set :root, File.dirname(__FILE__)
set :views, Proc.new { File.join(root, "views") }
set :environment, :production

run Sinatra::Application
