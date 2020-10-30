module ArticlesHelper
  def show_articles
    if @top_article.blank?
      content_tag(:h3, "There's no featured article yet", class: 'articles-cat-title')
    else
      bg_img = "background: no-repeat top center/cover url( #{show_picture(@top_article)});"
      p_text = content_tag(:div, sanitize(@top_article.text.truncate(100)), class: "trix-content featured-art-text")
      content_tag :article, class: 'featured-article d-flex flex-column j-content-end', style: bg_img do
        concat content_tag(:div, content_tag(:h2,
                                             link_to(@to_article.title,
                                                     article_path(@top_article.id),
                                                     class: 'featured-article-title chivo-bold') + p_text),
                           class: 'article-content')
      end
    end
  end
end
