class UsersController < ApplicationController


  # def index
  #   @user = User.all
  # end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params(:username, :email, :password, :name))
  #   if @user.save
  #     session[:user_id] = @user.id
  #   else
  #     render :new
  #   end
  # end

  def show
    if params[:id]
    @user = User.find(params[:id])
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params(:username, :email, :password, :full_name))
  #     flash[:notice] = 'User updated successfully.'
  #     redirect_to user_path(@user)
  #   else
  #     render :edit
  #   end
  # end


  #  private

  # def user_params(*args)
  #   params.require(:user).permit(*args)
  # end
end  