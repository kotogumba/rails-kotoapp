class Zone < ApplicationRecord
  has_and_belongs_to_many :medicines
  has_many :services, dependent: :destroy
end
