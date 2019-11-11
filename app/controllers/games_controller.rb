require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10).join
  end

  def score
    @word = params[:word]
    @array = params[:array]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    result = open(url).read
    data = JSON.parse(result)

    if data['word'].include?(@array)

      if data['found'] == false
      @answer = "Sorry but #{@word} does not seem to be a valid English word..."
      elsif data['found'] == true
        @answer = "Congratulations, #{@word} is a valid English word!"
      end

    else
      @answer = "Sorry but #{@word} can't be build out of #{@array}"
    end

  end
end
