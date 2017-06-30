class Movement < ApplicationRecord
  belongs_to :item
  belongs_to :status
  belongs_to :sector
  belongs_to :floor

  def fill(params)

    self.datetime = Time.current.strftime('%d/%m/%Y %T')
    self.item = Item.find_by_bar_code(params[:item_id])
    self.status = self.item.status
    self.sector = self.item.sector
    self.floor = self.item.sector.floor
    self.item_price = self.item.price
  end

  def this_item (id_item)

    @movements = Movement.find(id_item: id_item)

  end

  def to_date

    @movements_today = Movement.where(datetime: Date.current)

  end

  def to_type(params)
    @to_type = Movement.where(params[:type])
  end

end
