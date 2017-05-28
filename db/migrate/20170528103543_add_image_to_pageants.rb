class AddImageToPageants < ActiveRecord::Migration[5.1]
  def change
    add_column :pageants, :image, :string
  end
end
