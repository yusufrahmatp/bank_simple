class AddHashToBanks < ActiveRecord::Migration[5.1]
  def change
    add_column :banks, :hashid, :string
  end
end
