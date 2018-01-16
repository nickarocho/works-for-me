class CreateApproveds < ActiveRecord::Migration[5.1]
  def change
    create_table :approveds do |t|
      t.references :user, foreign_key: true
      t.references :availability, foreign_key: true

      t.timestamps
    end
  end
end
