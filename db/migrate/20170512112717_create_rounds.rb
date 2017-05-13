class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :deck_id, {null: false}
      t.integer :user_id, {null: false}
      t.integer :count, {default: 1}
      t.integer :first_round_corrects

      t.timestamps(null: false)
    end
  end
end
