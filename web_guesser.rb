require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  erb :index, :locals => {:number => number}
  # pass a hash in with the variable name as a sym pointing to its value
end
