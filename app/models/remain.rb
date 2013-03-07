class Remain < ActiveRecord::Base
  attr_accessible :remain_date, :product_id, :remain
  belongs_to :user, :polymorphic => true
  belongs_to :product
  validates :remain_date, :presence => true

end
