require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    8.times { @letters.push((65 + rand(25)).chr) }
  end

  def score
    @word = params[:word]
    @state = false
    @word.split('').each do |letter|
      @state = params[:letters].downcase.include?(letter)
    end
    @state = checkword(@word) if @state
  end

  private

  def checkword(attempt)
    api_url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    user = URI.open(api_url).read
    contenido = JSON.parse(user)
    contenido['found']
  end
end
