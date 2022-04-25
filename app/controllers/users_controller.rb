class UsersController < ApplicationController
  def index
    return redirect_to "/users/#{current_user.id}/categories" if current_user
  end

  def new
    @user = User.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
