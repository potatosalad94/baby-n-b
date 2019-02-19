class BabyPolicy < ApplicationPolicy
  def index?
    true
  end

  def search?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
