class RenameChosenSlotToRefAvailabilityOn < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :chosen_slot, :availability_id
  end
end
