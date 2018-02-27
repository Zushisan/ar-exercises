class Store < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, length: { minimum: 5 }
  validates :annual_revenue, numericality: { more_than_or_equal_to: 0,  only_integer: true }

  validate :apparel

  private

  def apparel
    if mens_apparel == false && womens_apparel == false
      errors.add(:base, "Store have to sell something !!")
    end
  end
end

# Stores must always have a name that is a minimum of 3 characters
# Stores have an annual_revenue that is a number (integer) that must be 0 or more
# BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)