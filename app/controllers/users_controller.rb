class UsersController < ApplicationController
  def index
    return redirect_to categories_path if current_user
  end
end
