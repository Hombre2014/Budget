class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
    @spendings = Spending.all
    @total = 0
  end

  def show
    @category = Category.find(params[:id])
    @spendings = Spending.all
    @spending = Spending.new
    # if(!@spendings.empty?) then
    #   @spending = Spending.find(params[:id])
    # end
    @total = 0
  end

  def new
    @user = current_user
    @category = @user.categories.new
    @category_icons = [
      ['Housing', ActionController::Base.helpers.image_path('Housing.png')],
      ['Transportation', ActionController::Base.helpers.image_path('Transportation.png')],
      ['Food', ActionController::Base.helpers.image_path('Food.png')],
      ['Utilities', ActionController::Base.helpers.image_path('Utilities.png')],
      ['Clothing', ActionController::Base.helpers.image_path('Clothing.png')],
      ['Medical', ActionController::Base.helpers.image_path('Medical.png')],
      ['Insurance', ActionController::Base.helpers.image_path('Insurance.png')],
      ['Supplies', ActionController::Base.helpers.image_path('Supplies.png')],
      ['Personal', ActionController::Base.helpers.image_path('Personal.png')],
      ['Education', ActionController::Base.helpers.image_path('Education.png')],
      ['Entertainment', ActionController::Base.helpers.image_path('Entertainment.png')],
      ['Business', ActionController::Base.helpers.image_path('Business.png')],
      ['Repairs', ActionController::Base.helpers.image_path('Repairs.png')]
    ]
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
