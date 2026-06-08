class TasteParameter < ApplicationRecord
  has_many :wine_taste_parameters
  has_many :wines, through: :wine_taste_parameters

  has_many :wine_profile_taste_parameters, foreign_key: :taste_parameter_id
  has_many :wine_profiles, through: :wine_profile_taste_parameters, foreign_key: :taste_parameter_id

  validates :label, uniqueness: true

  scope :sorted_by_label, -> { order(:label) }

end