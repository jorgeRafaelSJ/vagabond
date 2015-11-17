class AddImgThumbUrlToCities < ActiveRecord::Migration
  def change
    add_column :cities, :imgthumb_url, :string
  end
end
