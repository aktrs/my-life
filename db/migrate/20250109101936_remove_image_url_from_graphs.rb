class RemoveImageUrlFromGraphs < ActiveRecord::Migration[7.2]
  def change
    remove_column :graphs, :image_url, :string
  end
end
