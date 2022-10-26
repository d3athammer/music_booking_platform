class StudioPolicy < ApplicationPolicy
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
    return record.user == user
  end

  def update?
    return edit?
  end

  def destroy?
    return edit?
  end

  class Scope < Scope
    def resolve
      # same as studio.all
      scope.all
    end
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
