class CreateFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :frames do |t|
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
