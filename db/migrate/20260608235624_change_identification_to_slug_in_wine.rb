class ChangeIdentificationToSlugInWine < ActiveRecord::Migration[8.1]
  def change
    rename_column :wines, :identification, :slug
    add_index :wines, :slug, unique: true

    rename_column :wine_profiles, :identification, :slug
    add_index :wine_profiles, :slug, unique: true

    rename_column :taste_parameters, :identification, :slug
    add_index :taste_parameters, :slug, unique: true
  end
end
