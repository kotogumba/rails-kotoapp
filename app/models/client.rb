class Client < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    # all
  end
  has_many :services, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
end

Client.reindex!
