class UsersController < ApplicationController
def home
  @user = User.all
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


  private
  def new_user_param
    params.require(:user).permit(:username, :email, :password)
  end
end
