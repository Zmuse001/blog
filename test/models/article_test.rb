# frozen_string_literal: true

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save article without title" do 
    article = Article.new
    assert_not article.save
  end

  test "should return five most recent articles" do
    # Create some articles with different creation times
    article1 = Article.create(title: "Article 1", body: "Body 1", created_at: 5.days.ago)
    article2 = Article.create(title: "Article 2", body: "Body 2", created_at: 4.days.ago)
    article3 = Article.create(title: "Article 3", body: "Body 3", created_at: 3.days.ago)
    article4 = Article.create(title: "Article 4", body: "Body 4", created_at: 2.days.ago)
    article5 = Article.create(title: "Article 5", body: "Body 5", created_at: 1.day.ago)

    recent_articles = Article.last_five

    assert_equal 5, recent_articles.length, "Should return five recent articles"

    assert_equal [article5, article4, article3, article2, article1], recent_articles, "Articles should be in descending order of creation time"
  end

end
