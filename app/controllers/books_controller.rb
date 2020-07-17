class BooksController < ApplicationController

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def show
		@books = Book.all
		@book = Book.new
		@user = book.user
	end

	def edit
		@book = Book.new
	end

	def update
		@book = Book.find(params[:id])
  		if @book.update(book_params)
  	   		redirect_to book_path(@book), notice: 'Book was successfully created.'
    	else
      		render :edit
    	end
	end

	def create
		@book = Book.new(book_params)
    	if @book.save
      		redirect_to book_path(@book), notice: 'Book was successfully created.'
    	else
      		@books = Book.all
      		@book = Book.new
			@user = current_user
      		render :show
    	end
	end

	def destroy
		book = Book.find(params[:id])
  		book.destroy
  		redirect_to books_path
	end

	private
  	def book_params
  		params.require(:book).permit(:title, :body)
  	end
end
