require 'rails_helper'

RSpec.describe Article do
  let(:test_user) { User.create(name: 'test', email: 'test@test.com') }
  let(:article) do
    described_class.new(
      title: 'test title',
      body: 'test body',
      user_id: test_user.id,
      image_file_name: 'test.jpg',
      image_content_type: 'image/jpg',
      image_file_size: '8192',
      image_updated_at: nil
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(article).to be_valid
    end

    it 'Is not valid without text' do
      article.body = nil
      expect(article).not_to be_valid
    end

    it 'Text cannot be longer than 2,000' do
      article.body = '0' * 2001
      expect(article).not_to be_valid
    end

    it 'Is not valid without title' do
      article.title = nil
      expect(article).not_to be_valid
    end

    it 'Title cannot be longer than 50' do
      article.title = '0' * 51
      expect(article).not_to be_valid
    end
  end

  describe 'checking article author' do
    it 'user author is test' do
      expect(article.user.email).to eql('test@test.com')
    end

    it 'records cannot be blank ' do
      expect { Article.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'testing associations' do
    it 'has one user' do
      ar = Article.reflect_on_association(:user)
      expect(ar.macro).to eq(:belongs_to)
    end

    it 'has many categories' do
      ar = Article.reflect_on_association(:categories)
      expect(ar.macro).to eq(:has_many)
    end

    it 'has many votes' do
      ar = Article.reflect_on_association(:votes)
      expect(ar.macro).to eq(:has_many)
    end
  end
end
