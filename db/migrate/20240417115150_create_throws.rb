class CreateThrows < ActiveRecord::Migration[7.0]
  def change
    create_table :throws do |t|
      t.integer :pins_knocked
      t.references :frame, foreign_key: true

      t.timestamps
    end
  end
end
