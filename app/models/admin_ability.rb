class AdminAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    unless user.new_record?
      can :update, Review
    end
  end
end