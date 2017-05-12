class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :game_id, {null: false}

      t.timestamps(null: false)
    end
  end
end
