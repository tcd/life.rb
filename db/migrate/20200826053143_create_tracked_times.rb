class CreateTrackedTimes < ActiveRecord::Migration[6.0]
  def change()
    create_table("tracked_times", id: :uuid) do |t|
      t.string("description")
      t.string("source")
      t.datetime("date")
      t.datetime("start_time")
      t.datetime("end_time")
      t.integer("hours")
      t.integer("minutes")
      t.integer("seconds")
      t.jsonb("metadata", default: "{}")
      t.timestamps()
    end
  end
end
