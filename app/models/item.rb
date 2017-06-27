class Item < ApplicationRecord
  belongs_to :status
  belongs_to :sector
  belongs_to :type
  belongs_to :image
end
