class Useraddress < ActiveRecord::Base
  belongs_to :user
  has_many :order
end
