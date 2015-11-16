class ChangeDataTypeForCity < ActiveRecord::Migration
  def change
  	change_column :users, :city, 'integer USING CAST(city AS integer)'
  end
end
