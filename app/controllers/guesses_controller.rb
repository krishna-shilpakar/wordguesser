require 'word_collection'

class GuessesController < ApplicationController
  def index
    if params[:letter] && params[:count]
      a = WordCollection.new(params[:letter])
      @guess_words = a.get_words_with_length(params[:count].to_i)
    end
  end
end
