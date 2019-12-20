class BooksController < ApplicationController
before_action :authenticate_user!
before_action :correct_user,   only: [:edit, :update]

def index
	@book = Book.new
	@books = Book.all
	@user = current_user
	@users = User.all
end

def show
	@book = Book.find(params[:id])
	@books = Book.new
end

def create
	@book = Book.new(book_params)
	@book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully saved."
	  redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
end

def destroy
	@book = Book.find(book_params)
	if @book.destroy
	   flash[:notice] = "Book was successfully destroyed."
	   redirect_to book_path(@book.id)
	else 
		render :iedit
	end
end


def edit
	@book = Book.find(params[:id])
	
end

def update
	@book = Book.find(params[:id])
	if @book.update(book_params)
	   flash[:notice] = "Book was successfully updated."
	   redirect_to book_path(@book.id)
	else
	   render :edit
	end
end

private
def book_params
	params.require(:book).permit(:title, :body)
end
def correct_user
	@book = Book.find(params[:id])
	unless
	@book.user == current_user
      redirect_to books_path
end
end
end
