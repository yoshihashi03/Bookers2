class SearchController < ApplicationController
  before_action :authenticate_user!

  def search
  	@range = params[:range]
  	@search = params[:search]
  	@word = params[:word]
    @records = search_for(@range, @word, @search)
  end

    private
    def search_for(range, word, search)
      if range == 'user'
        if search =='perfect_match'
          User.where(name: word)
        elsif search == 'forward_match'
          User.where('name LIKE?', word+'%')
        elsif search == 'backward_match'
          User.where('name LIKE?', '%'+word)
        else
          User.where('name LIKE?', '%'+word+'%')
        end
      elsif range == 'book'
        if search =='perfect_match'
          Book.where(title: word)
        elsif search == 'forward_match'
          Book.where('title LIKE?', word+'%')
        elsif search == 'backward_match'
          Book.where('title LIKE?', '%'+word)
        else
          Book.where('title LIKE?', '%'+word+'%')
        end
      end
    end
end
