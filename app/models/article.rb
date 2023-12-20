# frozen_string_literal: true
class Article < ApplicationRecord
  include Visible
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :category, presence: true

  # Add this class method
  def self.last_five
    Article.last_five
  end
end
