class User::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user:user)
      end 
    end
  end

  def show?
    true
  end

  def index?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

end
