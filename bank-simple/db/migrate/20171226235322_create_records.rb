class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :type
      t.integer :prevbalance
      t.integer :currbalance
      t.datetime :created_at
    end
  end
end
