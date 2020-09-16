class AddColumnsToTrackedTimes < ActiveRecord::Migration[6.0]
  def change
    add_column :tracked_times, :timezone, :string
    add_column :tracked_times, :employer, :string
    add_column :tracked_times, :client, :string
    add_column :tracked_times, :project, :string
    add_column :tracked_times, :task, :string
    add_column :tracked_times, :total_seconds, :integer
  end
end
