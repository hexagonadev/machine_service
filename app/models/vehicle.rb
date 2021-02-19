class Vehicle < ActiveRecord::Base
<<<<<<< HEAD
  #belongs_to :user
  #has_many :appointment
  validates :user_id, presence: true
  validates :vin, uniqueness: true
  validates :vin, presence: true
=======
  belongs_to :user
  has_many :appointment

  validates :user_id, :kind, :brand, :model, :engine_size, :year, :color, :vin, presence: true
>>>>>>> upstream/main

end