class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :appointment

  validates :user_id, :king, :brand, :module, :engine_size, :year, :color, :vin, presence: true

end