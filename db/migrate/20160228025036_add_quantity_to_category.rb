class AddQuantityToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :quantity, :integer
  end
end
