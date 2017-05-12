class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.integer :round_id, {null: false}
      t.integer :card_id, {null: false}
      t.string :guess, {null: false}

      t.timestamps(null: false)
    end
  end
end
