require_relative '../rails_helper'

RSpec.describe RecipeCategory, type: :model do
  context 'testing associations' do
    it 'has one article' do
      a = RecipeCategory.reflect_on_association(:article)
      expect(a.macro).to eq(:belongs_to)
    end

    it 'has one category' do
      a = RecipeCategory.reflect_on_association(:category)
      expect(a.macro).to eq(:belongs_to)
    end
  end
end
