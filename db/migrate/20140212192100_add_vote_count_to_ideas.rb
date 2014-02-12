class AddVoteCountToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :vote_count, :integer, default: 0
  end
end
