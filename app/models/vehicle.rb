class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :appointment

  validates :user_id, :kind, :brand, :model, :engine_size, :year, :color, :vin, presence: true

end