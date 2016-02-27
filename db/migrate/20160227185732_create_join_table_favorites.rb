class CreateJoinTableFavorites < ActiveRecord::Migration
  def change
    create_join_table :users, :gifs do |t|
      # t.index [:user_id, :gif_id]
      # t.index [:gif_id, :user_id]
    end
  end
end
