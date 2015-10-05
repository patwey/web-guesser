require 'sinatra'
require 'sinatra/reloader'

set :number => rand(100)
cheat = 'false'

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
  if params['guess']
    guess = params['guess'].to_i
    message = check_guess(guess)
  else
    message = 'Please guess a number between 1 and 100.'
  end
  cheat = params['cheat'] if params['cheat']
  erb :index, :locals => {:number => settings.number, :message => message,
                          :cheat => cheat}
end
