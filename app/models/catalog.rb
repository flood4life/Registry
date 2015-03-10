class Catalog < ActiveRecord::Base
  has_many :products

  validates :name, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
