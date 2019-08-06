class UsersController < ApplicationController
  def index
    # @users =User.all
    @q = User.ransack(params[:q])

    if @q.present?
      @users = @q.result.page(params[:page])
    else
      @users = User.all.page(params[:page])
    end
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

  def show
    @user = User.find(params[:id])
  end
end