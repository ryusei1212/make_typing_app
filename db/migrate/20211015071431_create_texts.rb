class CreateTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :texts do |t|
      t.string :sentence
      t.integer :title_id

      t.timestamps
    end
  end
end
