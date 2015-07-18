class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.text :name
      t.string :description
      t.datetime :time
      t.string :amount
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
