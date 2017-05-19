class ReviewsController < ApplicationController
  def new
  end

  def create
    @book = params[:book_id]
    @review = Review.create(content: params[:review], rating: params[:rating], book: Book.find(params[:book_id]), user: User.find(session[:user_id]))
    redirect_to '/books/' + @book
  end

  def edit
  end

  def delete
  end

  def index
  end
end
