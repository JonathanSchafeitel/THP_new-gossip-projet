class AddColumnCityUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :city_id, :string
  end
end
