class Painting < ApplicationRecord
    belongs_to :museum
    validates :name, presence: true
  end