class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :value

      t.timestamps null: false
    end
  end
end
