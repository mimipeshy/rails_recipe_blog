module ApplicationHelper
  def like_or_dislike_btn(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('Dislike!', article_vote_path(id: vote.id, article_id: article.id), method: :delete)
    else
      link_to('Like!', articles_vote_path(article_id: article.id), method: :post)
    end
  end
end
