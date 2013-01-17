class FixCurrentUserCountForEvents < ActiveRecord::Migration
  def change
  	execute <<-SQL
    DROP TRIGGER "update_event_user_count";
	SQL
  end
end
