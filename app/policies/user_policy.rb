class UserPolicy < ApplicationPolicy

  def index?
	user && user.admin?
  end
  
  def edit?
	user && (user.admin? || record == user)
  end
  
  def new?
	user == nil || user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
