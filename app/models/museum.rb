class Museum < ApplicationRecord
    has_many :paintings, dependent: :destroy
    validates :name, presence: true
  end