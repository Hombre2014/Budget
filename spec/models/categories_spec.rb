require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category model' do
    @user = User.create(name: 'Yuriy', email: 'yuriy@example.com', password: '123456')
    subject { Category.new(user_id: @user, name: 'Sport', icon: 'Sport.png') }
    before { subject.save }

    it 'should check if the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check if the user id is not blank' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'should checks if the icon is not empty' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end
end
