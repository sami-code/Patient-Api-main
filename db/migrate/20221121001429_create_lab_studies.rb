class CreateLabStudies < ActiveRecord::Migration[7.0]
  def change
    create_table :lab_studies do |t|
      t.references :result, foreign_key: true
      t.string :code, null: false
      t.string :name, null: false
      t.string :reference_range, null: false
      t.string :observation_value, null: false
      t.boolean :normal, null: false, default: false
      t.timestamps
    end
  end
end
