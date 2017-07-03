class Status < ApplicationRecord

  scope :available, -> {where.not(describe: ['demaged', 'sold'])}
  scope :unavailable, -> {where(describe: ['demaged', 'sold'])}

end
