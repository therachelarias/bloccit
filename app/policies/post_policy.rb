class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope
    attr_reader :user, :scope
    
  def initialize(user, scope)
    @user = user
    @scope = scope
  end

    def resolve
      if user.present? && user.admin? || user.present? && user.moderator?
        scope.all
      elsif user.present?
        scope.where(user: user)
      else
        scope.none
      end
    end
  end
end