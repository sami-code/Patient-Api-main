class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.belongs_to :patient, foreign_key: true
      t.string :lab_id, null: false
      t.string :lab_code, null: false
      t.timestamp :tested_at, null: false
      t.timestamps
    end
  end
end
