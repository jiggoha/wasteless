class ChangeTextStringColumnType < ActiveRecord::Migration
  def change
  	change_column :postings, :name, :string
  	change_column :postings, :description, :text
  end
end
