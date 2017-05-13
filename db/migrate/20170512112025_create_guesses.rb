class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.string :guess, null: false
      t.integer :user_id

      t.timestamps(null: false)
    end
  end
end
