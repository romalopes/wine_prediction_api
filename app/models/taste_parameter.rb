class TasteParameter < ApplicationRecord
  has_many :wine_taste_parameters
  has_many :wines, through: :wine_taste_parameters

  has_many :wine_profile_taste_parameters, foreign_key: :taste_parameter_id
  has_many :wine_profiles, through: :wine_profile_taste_parameters, foreign_key: :taste_parameter_id

  validates :label, uniqueness: true

  scope :sorted_by_label, -> { order(:label) }

  before_validation :generate_slug, on: :create

  private

  def generate_slug
    return if slug.present?
    return if label.blank?

    base = label.parameterize
    candidate = base
    suffix = 1
    while TasteParameter.where.not(id: id).exists?(slug: candidate)
      suffix += 1
      candidate = "#{base}-#{suffix}"
    end
    self.slug = candidate
  end
end
