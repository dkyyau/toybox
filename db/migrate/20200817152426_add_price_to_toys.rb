class AddPriceToToys < ActiveRecord::Migration[6.0]
  def change
    add_column :toys, :price, :integer
  end
end
