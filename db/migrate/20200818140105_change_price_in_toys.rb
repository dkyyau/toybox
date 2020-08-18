class ChangePriceInToys < ActiveRecord::Migration[6.0]
  def change
    change_column :toys, :price, :decimal, :precision => 4, :scale => 2
  end
end
