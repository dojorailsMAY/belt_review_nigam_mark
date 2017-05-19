class BooksController < ApplicationController
  def new
    @authors = Author.all
  end

  def create
    @author = Author.find_by(id: params[:author_id])
    if @author
      puts "\n\n\n--------------\n\n\n"
      book = Book.create(title: params[:book_title], author: @author)
      user = User.find(session[:user_id])
      puts user.valid?
      puts user.errors.full_messages
      @review = Review.create(content: params[:review], rating: params[:rating], user: user, book: book)
      puts @review.errors.full_messages
      puts "\n\n\n--------------\n\n\n"
      redirect_to root_path
    else
      new_author = Author.create(name: params[:new_author])
      user = User.find(session[:user_id])
      book = Book.create(title: params[:book_title], author: new_author)
      review = Review.create(content: params[:review], rating: params[:rating], user: user, book: book)
      puts review.errors.full_messages
      puts "\n\n\n--------------\n\n\n"
      redirect_to root_path
    end
  end

  def edit
  end

  def delete
  end

  def index
    unless(session[:user_name] == nil)
      @books = Book.limit(3).order('created_at DESC')
    else
      redirect_to 'users/login'
    end
  end


  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
  end

  def show_author
    @author = Author.find(params[:id])
    @books = Book.where(author: @author)
    render 'author_page'
  end
end
