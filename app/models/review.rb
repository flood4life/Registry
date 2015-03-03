class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  scope :approved, -> {where(is_pending: false)}

  scope :pending, -> {where(is_pending: true)}
end
