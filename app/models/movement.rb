class Movement < ApplicationRecord
  belongs_to :item
  belongs_to :type
  belongs_to :status
  belongs_to :sector
  belongs_to :floor

  scope :availables, -> {where(item: Item.availables)}
  scope :unavailable, -> {where(item: Item.unavailables)}

  def fill(params)

    self.datetime = Time.current.strftime('%d/%m/%Y %T')
    self.item = Item.find_by_bar_code(params[:item_id])
    self.type = self.item.type
    self.status = self.item.status
    self.sector = self.item.sector
    self.floor = self.item.sector.floor
    self.item_price = self.item.price
  end

  def tag_fill(params)

    self.datetime = Time.current.strftime('%d/%m/%Y %T')
    self.item = Item.find_by_bar_code(params)
    self.type = self.item.type
    self.status = self.item.status
    self.sector = self.item.sector
    self.floor = self.item.sector.floor
    self.item_price = self.item.price
  end

  def count_type(type_id)
    Movement.type.where(type: type_id)
  end

  def to_type (id_item)

    @movements = Movement.find(id_item: id_item)

  end

  def for_date(date)

    Movement.where(datetime: date)

  end


end
