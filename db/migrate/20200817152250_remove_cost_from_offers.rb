class RemoveCostFromOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :cost, :integer
  end
end
