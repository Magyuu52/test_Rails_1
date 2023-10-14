class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :title
      t.date :start
      t.date :finish
      t.boolean :finday
      t.text :memo

      t.timestamps
    end
  end
end
