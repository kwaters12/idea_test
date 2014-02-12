class AddJoinByToUsers < ActiveRecord::Migration
  def change
    add_column :users, :join_by, :boolean, default: false
  end
end
