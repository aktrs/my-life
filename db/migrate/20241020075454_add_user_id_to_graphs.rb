class AddUserIdToGraphs < ActiveRecord::Migration[7.2]
  def change
    add_column :graphs, :user_id, :integer
  end
end
