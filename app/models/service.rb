class Service < ApplicationRecord
  belongs_to :medicine
  belongs_to :doctor
  belongs_to :client
end
