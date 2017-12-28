class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :transactions, :type, :trans_type
  end
end
