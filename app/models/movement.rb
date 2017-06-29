class Movement < ApplicationRecord


  def fill(params)
    self.id_item = params[:id_item]
    self.id_staus = params[:id_floor]
  end

  def this_item (id_item)

    @movements = Movement.find(id_item: id_item)

  end

  def to_date

    @movements_today = Movement.where(datetime: Date.current)

  end

end
