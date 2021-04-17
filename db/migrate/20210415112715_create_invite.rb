
class CreateInvite < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.references :attendee, null: false, foreign_key: { to_table: :users }, index: true
      t.references :attended_event, null: false, foreign_key: { to_table: :events }, index: true

      t.timestamps
    end
  end
end
