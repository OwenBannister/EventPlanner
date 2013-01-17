class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :duration
      t.date :date
      t.time :time
      t.integer :max_users
      t.integer :min_users

      t.timestamps
    end
  end
end
