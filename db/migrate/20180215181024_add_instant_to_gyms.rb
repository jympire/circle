class AddInstantToGyms < ActiveRecord::Migration[5.0]
  def change
    add_column :gyms, :instant, :integer, default: 1
  end
end
