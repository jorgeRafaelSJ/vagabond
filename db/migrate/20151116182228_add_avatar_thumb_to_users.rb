class AddAvatarThumbToUsers < ActiveRecord::Migration
    def self.up
    change_table :users do |t|
      t.attachment :avatarthumb
    end
  end

  def self.down
    remove_attachment :users, :avatarthumb
  end
end
