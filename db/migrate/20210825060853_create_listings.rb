class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :host, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.decimal :price_per_day
      t.boolean :available, default: false
      t.string :location
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end

#make it false because everytime
