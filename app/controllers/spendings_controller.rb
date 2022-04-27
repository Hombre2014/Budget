class SpendingsController < ApplicationController
  def index
    # @spendings = current_user.categories.spendings
    @spendings = Spending.all
  end

  def show
    if(!@spendings.empty?) then
      @spending = Spending.find(params[:id])
    end
  end

  def new
    @spending = Spending.new
    @categories = current_user.categories
  end

  def create
    @spending = Spending.new(spending_params)

    respond_to do |format|
      if @spending.save
        format.html { redirect_to user_categories_path, notice: "The spending was successfully recorded." }
        # format.json { render :show, status: :created, location: @spending }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @spending.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def spending_params
    params.require(:spending).permit(:user_id, :name, :amount, :category_id)
  end
end
