class UsersController < ApplicationController
  def index
    @users =User.all
  end

  def destroy

    @user = User.find(params[:id])
      if current_user.id == @user.id
        flash.now[:danger] = 'Invalid action perform'
        redirect_to users_path

      else
        @user.destroy
        redirect_to users_path
      end
  end

end