require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:questions]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word = URI.open(url).read
    hash = JSON.parse(word)

      if hash["found"]
        @response = "Bravo"
      else
        @response = "You lost my dear friend"
      end
  end
end
