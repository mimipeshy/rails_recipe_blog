require_relative '../rails_helper'
RSpec.describe 'Webpage workflow', type: :system do
  describe 'Navigate the webpage' do
    it 'User sign-up is correct' do
      # Access Home Page
      visit new_user_path
      sleep 2
      # Go to Sign Up page
      click_link('REGISTER')
      # Sign up
      sleep 2
      fill_in('user[name]', with: 'test')
      fill_in('user[email]', with: 'test@test.com')
      sleep 2
      click_button('SIGN UP')
      sleep 2
      click_link('Log Out')
    end
  end
end
