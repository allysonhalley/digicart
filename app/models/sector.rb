class Sector < ApplicationRecord

  enum floor: {ground: 0, first: 1, second: 2, third: 3, fourth: 4, fifth: 5}

end
