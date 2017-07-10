class Status < ApplicationRecord

  scope :available, -> {where.not(name: ['demaged', 'sold'])}
  scope :unavailable, -> {where(name: ['demaged', 'sold'])}

end
