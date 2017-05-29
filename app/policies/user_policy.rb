class UserPolicy < ApplicationPolicy

  def index?
	user && user.admin?
  end
  
  def create?
	user == nil || user.admin?
  end
    
  def update?
	user && (user.admin? || record == user)
  end
  
  def activate?
	user && user.admin?
  end
  

  class Scope < Scope
    def resolve
      scope
    end
  end
end
