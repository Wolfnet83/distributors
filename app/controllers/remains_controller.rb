class RemainsController < ApplicationController
  before_filter :authenticate_user!

  def index
   @remains = current_user.remains.where("remain_date = ?", @date) 
  end

  def remains_create
   t = Time.now.strftime("%Y-%m-%d")
   @date = params[:remain_date].presence || t
   if current_user.remains.where("remain_date = ?", @date).exists?
     @remains = current_user.remains.where("remain_date = ?", @date) 
   else
     products=Product.all
     products.each do |product|
       remain = Remain.new
       remain.product_id = product.product_id
       remain.distributor_id = current_user.distributor_id
       remain.remain_date = params[:remain_date]
       remain.remain = 0
       remain.save
     end
     @remains = current_user.remains.where("remain_date = ?", @date) 
   end
   render :template => 'remains/index'
  end

  def remains_update
    Remain.update(params[:remain_ids], params[:remain_quantity])
    @remains = current_user.remains.where("remain_date = ?", @date) 
    render :template => 'remains/index'
  end

end
