class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :toy, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :cost
      t.string :location
      t.boolean :accepted

      t.timestamps
    end
  end
end
