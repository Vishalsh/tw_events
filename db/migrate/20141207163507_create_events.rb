class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :event_date
      t.date :submission_close_date
      t.date :voting_close_date
      t.timestamps
    end
  end
end
