require 'will_paginate'
class Order < ActiveRecord::Base
  attr_accessor :layer_id
  attr_accessor :layerthickness_id
  attr_accessor :quantity
  attr_accessor :board_size_x
  attr_accessor :board_size_y

  belongs_to :pcb_pricing
  belongs_to :user
  belongs_to :useraddress
end
