class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :user_id, null: false
      t.integer :deck_id, null: false
      t.integer :complete, null: false, default: 0
      t.integer :first_tries
      t.integer :total_guesses

      t.timestamps(null: false)
    end
  end
end
