class Client < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    # all
  end
  has_many :services
  has_many_attached :photos
end

# Client.reindex!
