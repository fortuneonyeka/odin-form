class UsersController < ApplicationController
  def home
    @users= User.all
  end

  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(new_user_param)
    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
      flash[:error] = "Email can't be blank"
    end
  end

  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(new_user_param)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @user.destroy
      redirect_to root_path
    end
  end


  private
  def new_user_param
    params.require(:user).permit(:username, :email, :password)
  end
end
