class Vintage < ApplicationRecord
  belongs_to :wine

  validates :year, presence: true, numericality: { greater_than_or_equal_to: 1900 }
  validates :prompt, presence: true
end