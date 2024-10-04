class CreateGraphs < ActiveRecord::Migration[7.2]
  def change
    create_table :graphs do |t|
      t.integer :age
      t.integer :value
      t.string :comment
      t.timestamps
    end
  end
end
