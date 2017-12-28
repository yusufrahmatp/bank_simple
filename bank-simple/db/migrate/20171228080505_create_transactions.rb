class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :type
      t.integer :amount
      t.integer :user_id
      t.timestamps
    end
  end
end
