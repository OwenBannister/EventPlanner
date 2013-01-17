class AddCurrentUserCountToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :current_users, :integer, :default => 0

  	execute <<-SQL
  	CREATE TRIGGER IF NOT EXISTS "update_event_user_count" 
	AFTER UPDATE ON enrollments 
	FOR EACH ROW 
	  BEGIN 
	    UPDATE events set current_users = (select count(distinct student_id) from enrollments where event_id = new.event_id) where id = new.event_id;
	  end;
	SQL
  end
end
