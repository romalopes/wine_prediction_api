class WineProfile < ApplicationRecord
  has_many :wine_profile_taste_parameters, dependent: :destroy
  has_many :taste_parameters, through: :wine_profile_taste_parameters, foreign_key: :wine_profile_id

  before_validation :generate_slug, on: :create

  private

  def generate_slug
    return if slug.present?
    return if name.blank?

    base = name.parameterize
    candidate = base
    suffix = 1
    while WineProfile.where.not(id: id).exists?(slug: candidate)
      suffix += 1
      candidate = "#{base}-#{suffix}"
    end
    self.slug = candidate
  end
end
