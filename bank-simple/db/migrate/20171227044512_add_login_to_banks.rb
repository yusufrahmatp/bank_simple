class AddLoginToBanks < ActiveRecord::Migration[5.1]
  def change
    add_column :banks, :login, :string
  end
end
