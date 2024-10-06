class AddMonthToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :month, :integer
  end
end
