class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
    # @user = User.find(params[:user_id])
    # @categories = @user.categories.includes(:spendings)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    # @category = Category.new
    @user = current_user
    @category = @user.categories.new
  end

  def create
    @user = current_user
    @category = @user.categories.new(category_params)

    if @category.save
      flash[:notice] = 'The category have been created successfully.'
      redirect_to "/users/#{current_user.id}/categories"
    else
      flash[:alert] = 'Adding a new category failed.'
      render :new, status: :unprocessable_entity
    end
  end

  # def new
  #   @categories = current_user.categories.includes(:spendings)
  # end

  # def create
  #   @category = current_user.categories.new(category_params)

  #   respond_to do |format|
  #     if @category.save
  #       format.html { redirect_to category_path(@category), notice: 'Category was successfully created.' }
  #       # format.json { render :show, status: :created, location: @category }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       # format.json { render json: @category.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:user_id, :name, :icon)
  end
end
