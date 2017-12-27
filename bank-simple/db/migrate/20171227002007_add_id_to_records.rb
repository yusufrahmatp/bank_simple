class AddIdToRecords < ActiveRecord::Migration[5.1]
  def change
    add_column :records, :userid, :integer
  end
end
