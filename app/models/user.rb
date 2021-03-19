class User < ActiveRecord::Base
  has_many :vehicles, dependent: :destroy
  # has_many :maintenance_appointments
  # has_many :social_networks
  has_many :appointments, dependent: :destroy
  # has_and_belongs_to_many :roles
  # has_one :profile

  validates :email, presence: true, uniqueness: true, email_format: true

  # def to_json
  #   {
  #     name: name,
  #     email: email,
  #     vehicles: vehicles.map { |vehicle| { id: vehicle.id, brand: vehicle.brand } }
  #   }
  # end

end
