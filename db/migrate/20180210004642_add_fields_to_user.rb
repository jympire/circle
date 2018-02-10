class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :title, :string
    add_column :users, :certification, :string
    add_column :users, :certification_number, :string
    add_column :users, :insurance, :string
    add_column :users, :insurance_number, :string
    add_column :users, :school, :string
    add_column :users, :degree, :string
    add_column :users, :location, :string
    add_column :users, :interests, :string
  end
end
