class UsersController < ApplicationController

  def show
    if params[:id]
    @user = User.find(params[:id])
  end
  end

  # def destroy
  #   session.clear
  #   redirect_to root_path
  # end

end  