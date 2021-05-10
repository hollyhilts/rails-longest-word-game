class GamesController < ApplicationController
  def new
    array = []
    @letters = (0...10).map { |i| array[i] = ('A'..'Z').to_a.sample }
  end

  def score

  end
end
