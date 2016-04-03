class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :plate_number
      t.belongs_to :car_model, index: true, foreign_key: true
      t.string :contact_number
      t.string :model_year
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
