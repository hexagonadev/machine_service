class User < ActiveRecord::Base
  has_many :vehicles
  # has_many :maintenance_appointments
  # has_many :social_networks
  has_many :appointments
  # has_and_belongs_to_many :roles
  # has_one :profile

  validates :email, presence: true
  validates :email, uniqueness: true

  # def to_json
  #   {
  #     name: name,
  #     email: email,
  #     vehicles: vehicles.map { |vehicle| { id: vehicle.id, brand: vehicle.brand } }
  #   }
  # end

end
