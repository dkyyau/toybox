class RemoveLocationFromOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :location, :string
  end
end
