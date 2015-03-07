class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :message, length: {minimum: 10}

  validate :must_have_user_or_guest_name

  def must_have_user_or_guest_name
    unless guest_name.present? or user.present?
      errors.add(:guest_name, 'is not supplied.')
    end
  end

  scope :approved, -> {where(is_pending: false)}

  scope :pending, -> {where(is_pending: true)}
end
