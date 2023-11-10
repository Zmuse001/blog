# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible
  belongs_to :category  # Add this line to establish the association
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :category, presence: true 
end
