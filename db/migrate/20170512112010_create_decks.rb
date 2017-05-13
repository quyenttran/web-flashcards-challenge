class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :name, null: false

      t.timestamps(null: false)
    end
  end
end


#Did we update the decks to match our schema?