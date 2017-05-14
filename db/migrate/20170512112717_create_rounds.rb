class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :deck_id, {null: false}
      t.integer :user_id
      t.integer :first_round_corrects, {default: 0}
      t.integer :all_rounds_guesses, {default: 0}

      t.timestamps(null: false)
    end
  end
end
