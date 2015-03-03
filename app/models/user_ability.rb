class UserAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    unless user.new_record?
      can :create, Review
      can :update, Review, user_id: user.id
    end
  end
end