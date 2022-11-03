class AddAuthorToGossip < ActiveRecord::Migration[7.0]
  def change
    add_column :gossips, :author, :string
  end
end
