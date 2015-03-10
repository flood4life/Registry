class Product < ActiveRecord::Base
  belongs_to :catalog
  has_many :reviews

  after_create :remake_slug

  extend FriendlyId
  friendly_id :slug_candidates, use: :scoped, :scope => :catalog_id

  def slug_candidates
    [
        :name,
        [:name, :id]
    ]
  end

  def remake_slug
    self.update_attribute(:slug, nil)
    self.save!
  end
end
