class AddJoinByToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :join_by, :boolean, default: false
  end
end
