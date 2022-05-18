class GamesController < ApplicationController
  def new
    @vari = []
    8.times { @vari.push((65 + rand(25)).chr) }
  end

  def score
    raise
  end
end
