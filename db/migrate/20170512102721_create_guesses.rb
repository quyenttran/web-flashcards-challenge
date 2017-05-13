class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.integer :card_id, null: false
      t.integer :round_id, null: false
      t.integer :correct, default: 0

      t.timestamps(null: false)
    end
  end
end
