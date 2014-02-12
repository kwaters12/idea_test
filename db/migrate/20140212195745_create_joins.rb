class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.references :idea, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
