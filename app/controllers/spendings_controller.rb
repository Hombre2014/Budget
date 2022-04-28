class SpendingsController < ApplicationController
  def index
    @spendings = Spending.all
  end

  def show
    @spending = Spending.new
  end

  def new
    @spending = Spending.new
    @categories = current_user.categories
  end

  def create
    @spending = Spending.new(spending_params)

    respond_to do |format|
      if @spending.save
        format.html { redirect_to user_categories_path, notice: 'The spending was successfully recorded.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def spending_params
    params.require(:spending).permit(:user_id, :name, :amount, :category_id)
  end
end
