require 'sinatra'
require_relative 'lib/score_one'
# kept getting an error message suggesting I add this require, so I did.
require 'tilt/erb'

class MyApp < Sinatra::Base

  get '/' do
    @page_title = "Home"
    erb :index
  end

  get '/score' do
    @page_title = "score a word"
    erb :score
  end

  post '/score' do
    @page_title = "score a word"
    @word = Scoring::Word.new(params["word_to_score"]["word"])
    erb :score
  end

  get '/score_many' do
    @page_title = "score lots of words!"
    erb :score_many
  end

  post '/score_many' do
    @page_title = "score lots of words!"
    @words = Scoring::Words.new(params["many_form"])
    erb :score_many
  end

  run!
end
