namespace :neon_auth do
  desc "Create local neon_auth schema stub"
  task setup: :environment do
    ActiveRecord::Base.connection.execute(
      File.read(Rails.root.join('db/neon_auth_schema.sql'))
    )
    puts "neon_auth schema created locally"
  end
end
