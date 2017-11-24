class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.references :cocktail, foreign_key: true

      t.timestamps
    end
  end
end
