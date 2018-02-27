class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true 

  before_create :generate_password
  # before_save :generate_password
  # after_create :generate_password # I would have to update each employees row to populate password. I dont know why I would want to do that.

  private

  def generate_password
    self.password = (0...8).map { ('a'..'z').to_a[rand(26)] }.join
  end 

end


# Employees must always have a first name present
# Employees must always have a last name present
# Employees have a hourly_rate that is a number (integer) between 40 and 200
# Employees must always have a store that they belong to (can't have an employee that is not assigned a store)