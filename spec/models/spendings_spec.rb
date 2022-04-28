require 'rails_helper'

RSpec.describe 'Spendings', type: :model do
  describe 'Spending model' do
    user = User.create(name: 'Yuriy', email: 'yuriy@example.com', password: '123456')
    category = Category.new(user_id: @user, name: 'Food', icon: 'Food.png')
    subject { Spending.new(user_id: user, name: 'Dinning out', amount: 60, category_id: 1) }
    before { subject.save }

    it 'should check that the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check that the user id is not blank' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'should check that the amount is not blank' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should check that the category_id is not blank' do
      subject.category_id = nil
      expect(subject).to_not be_valid
    end
  end
end
