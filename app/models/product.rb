class Product < ActiveRecord::Base
  belongs_to :catalog
  has_many :reviews
end
