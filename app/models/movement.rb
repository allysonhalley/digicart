class Movement < ApplicationRecord
  belongs_to :item
  belongs_to :status
  belongs_to :sector
  belongs_to :floor

  def fill(params)

    self.datetime = params[:datetime]

    self.item = Item.find(params[:item_id])
    self.status = Status.find(params[:status_id])
    self.sector = Sector.find(params[:sector_id])
    self.floor = Floor.find(params[:floor_id])
    self.item_price = params[:item_price]
  end

  def this_item (id_item)

    @movements = Movement.find(id_item: id_item)

  end

  def to_date

    @movements_today = Movement.where(datetime: Date.current)

  end

end
