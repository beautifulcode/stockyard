class UsersController < ApplicationController
  
  layout 'stockyard'
  # before_filter :require_user_unless_empty, :only => [:new, :create]
  # before_filter :require_user, :only => [:show, :edit, :update]
  
  def require_user_unless_empty
    User.count == 0
  end
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default user_path(@user)
    else
      render :action => :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @user ||= @current_user
  end
 
  def edit
    @user = User.find(params[:id])
    @user ||= @current_user
  end
  
  def update
    @user = User.find(params[:id])
    @user ||= @current_user
    
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to user_path(@user)
    else
      render :action => :edit
    end
  end
end