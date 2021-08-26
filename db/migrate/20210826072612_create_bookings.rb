class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true
      t.string :ref_no
      t.date :check_in_date
      t.date :check_out_date
      t.integer :status, default: 0
      t.decimal :total

      t.timestamps
    end
  end
end
