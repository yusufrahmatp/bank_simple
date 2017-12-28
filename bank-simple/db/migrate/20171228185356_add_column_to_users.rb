class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :active, :string
    add_column :users, :chance, :integer
  end
end
