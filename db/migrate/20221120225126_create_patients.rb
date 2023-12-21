class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.string :nationality, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :ic_number, null: false
      t.integer :gender, null: false
      t.timestamp :birth_of_date, null: false
      t.timestamps
    end
  end
end
