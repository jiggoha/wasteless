class AddGeoColumnsRemoveAmountColumn < ActiveRecord::Migration
  def change
  	add_column :postings, :address,      :string
  	add_column :postings, :city,         :string
		add_column :postings, :state,        :string
		add_column :postings, :state_code,   :string
		add_column :postings, :postal_code,  :string
		add_column :postings, :country,      :string
		add_column :postings, :country_code, :string

		remove_column :postings, :amount
  end
end
