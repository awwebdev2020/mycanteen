class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def index?
    true
  end

  def create?
    true
  end
end
