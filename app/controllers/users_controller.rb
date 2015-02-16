class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    @user.edit(user_params)
    if @user.save
      redirect_to new_order_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

end