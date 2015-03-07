class UserAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :create, :read, :update, :destroy, :to => :crud

    can :create, Review

    unless user.new_record?
      can :crud, Review, user_id: user.id
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
      can :crud, Review
    end

    def approver
      can :approve, Review
      can :pending, Review
      can :destroy, Review, is_pending: true
    end
end