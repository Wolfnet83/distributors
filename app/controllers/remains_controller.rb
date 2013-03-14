class RemainsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :detect_date, :only => [:index]

  def index
   @remains = current_user.remains.at_date(@date) 
  end

  def remains_create
   if current_user.remains.at_date(@date).exists?
     @remains = current_user.remains.at_date(@date) 
   else
     #products = Product.all
     #products.each do |product|
       #remain = Remain.new
       #remain.product_id = product.id
       #remain.distributor_id = current_user.distributor_id
       #remain.remain_date = params[:remain_date]
       #remain.remain = 0
       #remain.save
     #end
     @remains = current_user.remains.at_date(@date) 
   end
   redirect_to remains_path(:remain_date => @date)
  end

  def remains_update
    Remain.update(params[:remain_ids], params[:remain_quantity])
    @remains = current_user.remains.at_date(@date) 
    redirect_to remains_path(:remain_date => @date)
  end

  private
  def detect_date
   t = Date.today.to_formatted_s(:db)
   @date = params[:remain_date].presence || t
  end

end
