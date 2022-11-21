class Medicine < ApplicationRecord
  has_many :services
  has_and_belongs_to_many :zones
end
