class AddUrlToCocktail < ActiveRecord::Migration[5.1]
  def change
    add_column :cocktails, :url, :string
  end
end
