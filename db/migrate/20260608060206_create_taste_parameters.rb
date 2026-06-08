class CreateTasteParameters < ActiveRecord::Migration[8.1]
  def change
    create_table :taste_parameters do |t|
      t.string :identification
      t.string :label
      t.string :low
      t.string :high
      t.text :help

      t.timestamps
    end
  end
end
