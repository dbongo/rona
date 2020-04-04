class County < ApplicationRecord
  belongs_to :state
  belongs_to :country
end
