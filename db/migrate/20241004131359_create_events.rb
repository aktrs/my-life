class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.integer :age
      t.string :event
      t.text :event_detail
      t.timestamps
    end
  end
end
