module NeonAuth
  class Session < ApplicationRecord
    self.table_name = 'neon_auth.session'
    belongs_to :user, class_name: 'NeonAuth::User', foreign_key: :user_id
  end
end