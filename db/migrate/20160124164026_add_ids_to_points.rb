class AddIdsToPoints < ActiveRecord::Migration
  def change
    add_column :points, :receiver_id, :integer
    add_index :points, :receiver_id
    add_column :points, :rewarder_id, :integer
    add_index :points, :rewarder_id
    remove_column :points, :user_id, index: true
  end
end
