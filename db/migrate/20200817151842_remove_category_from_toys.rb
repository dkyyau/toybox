class RemoveCategoryFromToys < ActiveRecord::Migration[6.0]
  def change
    remove_column :toys, :category, :string
  end
end
