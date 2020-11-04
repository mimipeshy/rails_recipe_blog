module CategoriesHelper
  def category_view_pattern(index, article, category)
    if (index.even? && (index % 4).zero?) || (index.odd? && ((index - 1) % 4).zero?)
      container = capture { render partial: 'picture', locals: { article: article } }
      container << capture { render partial: 'description', locals: { article: article, category: @category } }
    else
      container = capture { render partial: 'description', locals: { article: article, category: category } }
      container << capture { render partial: 'picture', locals: { article: article } }
    end
    container
  end
end
