class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.integer :duration
      t.integer :chosen_slot

      t.timestamps
    end
  end
end
