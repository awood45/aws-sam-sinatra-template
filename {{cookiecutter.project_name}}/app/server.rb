require 'sinatra'
require_relative 'app_table'

get "/" do
  erb :hello
end
