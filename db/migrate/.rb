class CreateTablePageants < ActiveRecord::Migration[5.1]
  def change
    create_table :tablepageants do |t|
      t.string :name
      t.text :description
      t.text :category
      t.datetime :startdate
      t.datetime :enddate
      
      t.timestamps
    end
  end
end
