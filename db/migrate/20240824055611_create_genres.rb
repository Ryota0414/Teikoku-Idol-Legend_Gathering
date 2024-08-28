class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name
      t.text :body
      t.integer :HP
      t.integer :Vo
      t.integer :Da
      t.integer :Vi
      t.integer :Vo_percent
      t.integer :Da_percent
      t.integer :Vi_percent
      t.integer :super_HP
      t.integer :super_Vo
      t.integer :super_Da
      t.integer :super_Vi
      t.integer :super_Vo_percent
      t.integer :super_Da_percent
      t.integer :super_Vi_percent


      t.timestamps
    end
  end
end
