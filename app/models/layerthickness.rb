class Layerthickness < ActiveRecord::Base
  belongs_to :layer
  has_many :pcb_pricing
end
