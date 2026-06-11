module NeonAuth
  class User < ApplicationRecord
    self.table_name = 'neon_auth.user'
  end
end