require_relative '../rails_helper'

RSpec.describe Vote, type: :model do
  context 'creating votes' do
    let(:user) { User.create(name: 'test', email: 'test@test.com') }
    let(:article) { Article.create(title: 'Title test', body: 'Test article content', user_id: user.id) }
    let(:vote) { Vote.create(user_id: user.id, article_id: article.id) }

    it 'voted article content to be Test article content' do
      expect(vote.article.body).to eql('Test article content')
    end
  end

  context 'testing associations' do
    it 'has one user' do
      v = Vote.reflect_on_association(:user)
      expect(v.macro).to eq(:belongs_to)
    end

    it 'has one article' do
      v = Vote.reflect_on_association(:article)
      expect(v.macro).to eq(:belongs_to)
    end
  end
end
