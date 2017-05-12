class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.string :name, null: false
      t.integer :first_try, null: false
      t.integer :card_id, null: false
      t.integer :round_id, null: false

      t.timestamps(null: false)
    end
  end
end
