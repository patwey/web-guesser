require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

def check_guess(guess)
  if guess > settings.number + 5
    message = 'Way too high!'
  elsif guess < settings.number - 5
    message = 'Way too low!'
  elsif guess < settings.number
    message = 'Too low!'
  elsif guess > settings.number
    message = 'Too high!'
  else
    message = 'You got it right!'
  end
end

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => settings.number, :message => message}
  # pass a hash in with the variable name as a sym pointing to its value
end
