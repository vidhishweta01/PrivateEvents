class RemoveParticipantidFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :participant_id, :string
  end
end
