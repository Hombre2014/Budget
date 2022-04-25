class UsersController < ApplicationController
  def index
    def index
      unless current_user.nil?
        redirect_to categories_path
      end
    end
  end
end
