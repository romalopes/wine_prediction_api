module NeonAuth
  class Session < ApplicationRecord
    self.table_name = 'neon_auth.session'
    belongs_to :user, class_name: 'NeonAuth::User', foreign_key: :user_id

    def self.schema_exists?
      ActiveRecord::Base.connection
        .execute("SELECT 1 FROM information_schema.schemata WHERE schema_name = 'neon_auth'")
        .any?
    rescue
      false
    end
  end
end