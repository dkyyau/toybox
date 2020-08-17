class AddReferencesToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :user
  end
end
