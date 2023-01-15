require 'sinatra'
require 'sinatra/json'

require_relative 'requests/wordnik'

DEFAULT_LENGTH = 7

get '/randomWord' do
  length = params['length'].to_i || DEFAULT_LENGTH

  word = Wordnik.randomWord(length)
  loop do
    break if word.match? /\A[a-zA-Z]*\z/
    word = Wordnik.randomWord(length)
  end

  payload = {
    word: word.upcase
  }

  json payload
end
