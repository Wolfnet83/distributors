class Remain < ActiveRecord::Base
  attr_accessible :remain_date, :remain
  belongs_to :user, :polymorphic => true
  belongs_to :product
  validates :remain_date, :presence => true

  def self.at_date(date)
    where("date(remain_date) = ?", date)
  end
end
