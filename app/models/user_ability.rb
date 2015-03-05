class UserAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :create, Review

    unless user.new_record?
      can :manage, Review, user_id: user.id
      if user.moderator?
        moderator
      end
      if user.approver?
        approver
      end
    end
  end

  private
    def moderator
      can :manage, Review
    end

    def approver
      can :approve, Review
      can :pending, Review
    end
end