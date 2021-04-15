# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :date_time
      t.string :location
      t.belongs_to :creator, foreign_key: { to_table: :users }, index: true, null: false
      t.timestamps
    end
  end
end
