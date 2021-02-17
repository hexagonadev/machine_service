class Vehicle < ActiveRecord::Base
  #belongs_to :user
  #has_many :appointment
  validates :user_id, presence: true
  validates :vin, uniqueness: true
  validates :vin, presence: true

end