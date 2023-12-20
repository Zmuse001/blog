# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  
  # Add this method
  def total_articles
    articles.count
  end

end
