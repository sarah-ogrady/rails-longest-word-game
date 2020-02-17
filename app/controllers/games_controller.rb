require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters_array = ('a'..'z').to_a
    @sample = @letters_array.sample(10)
  end

  def score
    @input = params[:input]
    @letters = params[:letters].chars
    if @letters.all? { |letter| @letters.count(letter) >= @input.count(letter) }
      if JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@input}").read)['found']
        @score = 10
      else
        @score = 0
      end
    else
      @score = 0
    end
  end
end
