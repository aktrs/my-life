class AddImageUrlToGraphs < ActiveRecord::Migration[7.2]
  def change
    add_column :graphs, :image_url, :string
  end
end
