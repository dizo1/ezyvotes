class AddColumnsToPageants < ActiveRecord::Migration[5.1]
  def change
    add_column :pageants, :name, :string
    add_column :pageants, :description, :text
    add_column :pageants, :category, :string
    add_column :pageants, :startdate, :datetime
    add_column :pageants, :enddate, :datetime
    add_column :pageants, :timezone, :string
      
    t.timestamps
  end
end
