class CreateLuggages < ActiveRecord::Migration[7.0]
  def change
    create_table :luggages do |t|
      t.integer :things_number
      t.decimal :weight

      t.timestamps
    end
  end
end
