class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.integer :count, default: 0
      t.boolean :correct, default: false
      t.integer :user_id
      t.integer :card_id

      t.timestamps(null: false)
    end
  end
end
