class AddImageIdToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :image_id, :string
  end
end
