class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_date
      t.datetime :submission_close_date
      t.datetime :voting_close_date
      t.timestamps
    end
  end
end
