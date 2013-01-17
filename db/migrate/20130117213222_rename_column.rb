class RenameColumn < ActiveRecord::Migration
  def up
  	rename_column :enrollments, :student_id, :user_id
  end

  def down
  	rename_column :enrollments, :user_id, :student_id 
  end
end
