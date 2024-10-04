class ChangeNukkConstratintOnTimestampsInEvents < ActiveRecord::Migration[7.2]
  def change
    change_column_null :events, :created_at, false
    change_column_null :events, :updated_at, false
  end
end
