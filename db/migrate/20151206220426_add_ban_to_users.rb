class AddBanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :baned, :boolean, default: false
  end
end
