require 'rails_helper'

RSpec.describe Spending, type: :model do
  describe 'Spending model' do
    before(:each) do
      @user = User.create name: 'Tester', email: 'tester@example.com', password: '123456'
      @category = Category.create name: 'Sport', icon: 'Sport.png', user: @user
      @spending = Spending.create name: 'Gym fee', amount: 45, user_id: @user, category_id: 1
    end

    it 'validates name' do
      @spending.name = ''

      expect(@spending).to_not be_valid
    end

    it 'validates amount' do
      @spending.amount = ''

      expect(@spending).to_not be_valid
    end

    it 'has a correct user name' do
      expect(@user.name).to eq 'Tester'
    end

    it 'has a correct type' do
      expect(@spending.category_id).to eq 1
    end
  end
end
