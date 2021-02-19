class Appointment < ActiveRecord::Base
<<<<<<< HEAD
  #belongs_to :user
  #belongs_to :vehicle
  has_many :maintenance
  validates :user, presence: true
  validates :vehicle, presence: true
=======
  belongs_to :user
  belongs_to :vehicle
  #has_many :maintenance

  validates :user_id, :description, :appointment_date, :vehicle_id, presence: true
>>>>>>> upstream/main
end