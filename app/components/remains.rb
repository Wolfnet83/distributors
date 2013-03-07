
class Remains < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Remain"
    c.rows_per_page = 50

    c.columns = [
      {:name => :product_id
        #:getter => :product.product_name
       },
      :remain_date,
      :remain
    ]
  end
end

