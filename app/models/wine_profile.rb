class WineProfile < ApplicationRecord
   has_many :wine_profile_taste_parameters, dependent: :destroy
  has_many :taste_parameters, through: :wine_profile_taste_parameters, foreign_key: :wine_profile_id
end
