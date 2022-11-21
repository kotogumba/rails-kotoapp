class Service < ApplicationRecord
  validates :client_id, presence: true
  validates :doctor_id, presence: true
  validates :medicine_id, presence: true
  validates :zone_id, presence: true

  belongs_to :medicine
  belongs_to :doctor
  belongs_to :client
  belongs_to :zone
end
