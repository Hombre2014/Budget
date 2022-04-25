class CategoriesController < ApplicationController
  # def index
  #   @user = User.find(params[:user_id])
  #   @categories = @user.categories.includes(:spendings)
  # end

  def index
    @categories = current_user.categories
    # @category = Category.find_by(id: params[:id])
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = current_user.category.includes(:spendings)
  end

  # def new
  #   @category = Category.new
  # end
end
