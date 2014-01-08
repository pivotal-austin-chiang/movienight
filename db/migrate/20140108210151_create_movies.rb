class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :mpaa
      t.string :a_rating
      t.integer :a_score
      t.integer :c_score
      t.string :image
      t.text :synopsis

      t.timestamps
    end
  end
end
