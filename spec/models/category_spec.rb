require_relative '../rails_helper'

RSpec.describe Category, type: :model do
  context 'creating categories' do
    it 'records cannot be blank ' do
      expect { Category.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'Creating article on a category' do
    let(:category) { Category.create(name: 'drinks', priority: 1) }
    let(:article) { category.articles.create(title: 'How to make a smoothie', body: 'just blend stuff', user_id: 1) }

    it 'user author is test' do
      expect(category.articles).to include(article)
    end
  end

  context 'testing associations' do
    it 'has many articles' do
      c = Category.reflect_on_association(:articles)
      expect(c.macro).to eq(:has_many)
    end

    it 'has many article_categories' do
      c = Category.reflect_on_association(:recipe_categories)
      expect(c.macro).to eq(:has_many)
    end
  end

  context 'categories scope' do
    let(:category_1) { Category.create(name: 'cakes', priority: 1) }
    let(:category_2) { Category.create(name: 'drinks', priority: 2) }
    let(:category_3) { Category.create(name: 'snacks', priority: 3) }
    let(:user) { User.create(name: 'test', email: 'test@test.com') }
    let(:article_1) do
      category_1.articles.create!(title: 'New Title',
                                  body: 'content',
                                  user_id: user.id,
                                  created_at: '2020-10-25')
    end
    let(:article_2) do
      category_1.articles.create!(title: 'New Title 2',
                                  body: 'content 2',
                                  user_id: user.id,
                                  created_at: '2020-10-25')
    end
  end
end
