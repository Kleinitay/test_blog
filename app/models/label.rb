class Label < ActiveRecord::Base
  attr_accessible :name
  belongs_to :post
end
