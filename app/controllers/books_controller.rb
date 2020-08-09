class BooksController < ApplicationController
	before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index]

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def show
		@books = Book.all
		@book = Book.find(params[:id])
		@user = @book.user
		@book_comment = BookComment.new
		@book_comments = @book.book_comments
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
  		if @book.update(book_params)
  	   		redirect_to book_path(@book), notice: 'You have book updated successfully.'
    	else
      		render :edit
    	end
	end

	def create
		@book = Book.new(book_params)
		@user = current_user
		@books = Book.all
		@book.user_id = current_user.id
    	if @book.save
      		redirect_to book_path(@book), notice: 'You have book created successfully.'
    	else
      		render :index
    	end
	end

	def destroy
		book = Book.find(params[:id])
  		book.destroy
  		redirect_to books_path
	end

	private
  	def book_params
  		params.require(:book).permit(:title, :body, :user_id)
  	end
end
