require 'rails_helper'

RSpec.describe 'Testing Categories view', type: :feature do
  describe 'Category#index' do
    before(:each) do
      User.create! name: 'Tester', email: 'tester@example.com', password: 'password'
      visit new_user_session_path
      fill_in 'Email', with: 'tester@example.com'
      fill_in 'Password', with: 'password'
      click_button 'LOG IN'
      visit '/users/1/categories'
    end

    subject { Category.new(user_id: @user, name: 'Sport', icon: 'Sport.png') }
    before { subject.save }

    it 'can see the Add new category' do
      expect(page).to have_content 'ADD NEW CATEGORY'
    end

    it 'should be able to see Welcome user name' do
      expect(page).to have_content 'Welcome, Tester'
    end
  end
end
