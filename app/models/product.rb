class Product < ActiveRecord::Base
  belongs_to :catalog
  has_many :reviews

  validates :name, uniqueness: {scope: :catalog_id, message: "Name should be unique in category"}
end
