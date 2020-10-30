require_relative '../rails_helper'
require_relative 'factory_bot'

RSpec.describe 'Webpage workflow', type: :system do
  before(:each) do
    FactoryBot.create(:user)
    FactoryBot.create(:article1)
    FactoryBot.create(:article2)
    FactoryBot.create(:article3)
    FactoryBot.create(:article4)
    test_category1 = Category.create!(priority: 1, name: 'user_category1')
    test_category2 = Category.create!(priority: 2, name: 'user_category2')
    test_category3 = Category.create!(priority: 3, name: 'user_category3')
    test_category4 = Category.create!(priority: 4, name: 'user_category4')
    ArticleCategory.create!(article_id: 1, category_id: test_category1.id)
    ArticleCategory.create!(article_id: 2, category_id: test_category2.id)
    ArticleCategory.create!(article_id: 3, category_id: test_category3.id)
    ArticleCategory.create!(article_id: 4, category_id: test_category4.id)
  end
  
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

  describe 'Write an article' do
    it 'path is correct' do
      # Access Home Page
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
      # write a recipe
      click_link('WRITE A RECIPE')
      sleep 2
      fill_in('article[title]', with: 'test title')
      sleep 1
      fill_in('article[body]', with: 'test text for test article')
      sleep 1
      attach_file('Image', 'spec/images/test.jpg')
      click_button('CREATE')
      sleep 2
      click_link('Log Out')
    end
  end
end
