require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    array = []
    @letters = (0...10).map { |i| array[i] = ('A'..'Z').to_a.sample }
  end

  def score
    @lets = params[:letters].gsub(' ', ',')
    if grid_check == false
      @score = 0
    elsif dictionary_check == false
      @score = 1
    elsif grid_check && dictionary_check
      @score = 2
    end
  end

  def dictionary_check
    url = "https://wagon-dictionary.herokuapp.com/#{params[:guess]}"
    json = open(url).read
    word = JSON.parse(json)
    word['found']
  end

  def grid_check
    array = @lets.split(',')
    guess = params[:guess].upcase
    guess.chars.all? { |letter| guess.count(letter) <= array.count(letter) }
  end
end
