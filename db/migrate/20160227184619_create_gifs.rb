class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :name
      t.string :image_path
      t.references :category, index: true, foreign_key: true
    end
  end
end
