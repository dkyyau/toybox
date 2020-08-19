class AddLocationToToys < ActiveRecord::Migration[6.0]
  def change
    add_column :toys, :location, :string
  end
end
