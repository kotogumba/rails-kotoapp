class Client < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    # all
  end
  has_many :services
end

Client.reindex!
