class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.string :username
      t.string :password
      t.integer :balance
      t.string :active
      t.integer :chance
    end
  end
end
