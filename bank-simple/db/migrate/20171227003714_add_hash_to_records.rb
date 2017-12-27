class AddHashToRecords < ActiveRecord::Migration[5.1]
  def change
    add_column :records, :hashid, :string
  end
end
