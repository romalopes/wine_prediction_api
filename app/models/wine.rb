class Wine < ApplicationRecord
  has_many :wine_taste_parameters, dependent: :destroy
  has_many :taste_parameters, through: :wine_taste_parameters

  validates :name, presence: true
  validates :region, presence: true
  validates :color, presence: true

end

