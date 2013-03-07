class AdminPageController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :manage, Product
  end

  def upload
    Product.import(params[:file])
    redirect_to admin_page_index_path
  end

end
