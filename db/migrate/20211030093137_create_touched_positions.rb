class CreateTouchedPositions < ActiveRecord::Migration[7.0]
  def change
    create_table :touched_positions do |t|
      t.string :answerer_id
      t.references :answer, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
