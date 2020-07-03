class PcbPricing < ActiveRecord::Base

  belongs_to :layerthickness
  has_many :order
end