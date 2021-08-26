class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing #create associations

  delegate :host, to: :listing #to get/to know the details of hosts

  enum status: [:pending, :paid, :cancelled] #enum - enumerable status (from booking columns)

  after_create :generate_ref_no  #after booking ref.no will be created
  after_create :calculate_total #

  def generate_ref_no   #method to generate references no. for bookings
    #y7w40p - example
    random_string = SecureRandom.hex(3)
    self.ref_no = random_string
    self.save
  end

  def calculate_total #method to calculate the totals
    days_between = (check_out_date.to_date - check_in_date.to_date).to_i
    total_days = days_between + 1
    self.total = listing.price_per_day * total_days
    self.save
  end
end
