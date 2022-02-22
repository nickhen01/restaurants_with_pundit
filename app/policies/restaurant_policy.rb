class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all # scope == Restaurant
      else
        scope.where(user: user)
        # Restaurant.where(user: user) user == current_user
      end
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    user == record.user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
