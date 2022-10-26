class RoomPolicy < ApplicationPolicy
  def index?
    return true
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return new?
  end

  def edit?
    return record.user_id == user.id
  end

  def update?
    return edit?
  end

  def destroy?
    return true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
