class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content

      t.timestamps null: false

      t.belongs_to :user
      t.belongs_to :city
    end
  end
end
