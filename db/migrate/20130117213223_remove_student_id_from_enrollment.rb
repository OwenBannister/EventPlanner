class RemoveStudentIdFromEnrollment < ActiveRecord::Migration
  def up
    remove_column :enrollments, :student_id
  end

  def down
    add_column :enrollments, :student_id, :integer
  end
end
