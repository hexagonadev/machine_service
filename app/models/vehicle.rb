class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :appointments, dependent: :destroy

  validates :user_id, :kind, :brand, :model, :engine_size, :year, :color, :vin, presence: true

end