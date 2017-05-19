class UsersController < ApplicationController
  def new
  end

  def create

    @user = User.create(name:params[:name], alias:params[:alias], email:params[:email], password:params[:password], password_confirmation: params[:password_confirm])
    session[:user_name] = @user.name
    session[:user_id] = @user.id
    if @user.valid?
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to '/users'
    end
  end

  def login
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    puts @user
    if @user
      session[:user_name] = @user.name
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] =  "No user found"
      redirect_to '/users'
    end
  end

  def logout
    reset_session
    redirect_to '/users'
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    User.update(name: params[:name], email: params[:email], alias: params[:alias])
  end
end
