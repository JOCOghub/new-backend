class Painting < ApplicationRecord
    belongs_to :museum
    validates :content, presence: true
  end