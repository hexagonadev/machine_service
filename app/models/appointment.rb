class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :vehicle
  #has_many :maintenance

  validates :user_id, :description, :appointment_date, :vehicle_id, presence: true
end