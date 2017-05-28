class CreateContestants < ActiveRecord::Migration[5.1]
  def change
    create_table :contestants do |t|
      t.integer :number
      t.string :name
      t.text :profile
      t.string :image

      t.timestamps
    end
  end
end
