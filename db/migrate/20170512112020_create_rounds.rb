class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :score, default: 0
      t.integer :guess, default: 0
      t.integer :user_id
      t.integer :deck_id
      t.integer :card_id

      t.timestamps(null: false)
    end
  end
end
