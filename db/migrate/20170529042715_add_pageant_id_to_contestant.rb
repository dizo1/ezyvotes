class AddPageantIdToContestant < ActiveRecord::Migration[5.1]
  def change
    add_column :contestants, :pageant_id, :integer
  end
end
