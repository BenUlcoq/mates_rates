# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Tool
    return unless user.present?
      can :manage, Tool, user_id: user.id
      can :manage, Rental, user_id: user.id

      can :delete, Rental,  Rental do |rental|
        user.id == rental.tool.user_id
      end

      cannot :delete, Rental, Rental do |rental|
        rental.start_date <= Time.now + 1.day
      end
      
    return unless user.has_role? :admin
      can :manage, :all
    

  end
  # Define abilities for the passed in user here. For example:
  #
  #   user ||= User.new # guest user (not logged in)

  #
  # The first argument to `can` is the action you are giving the user
  # permission to do.
  # If you pass :manage it will apply to every action. Other common actions
  # here are :read, :create, :update and :destroy.
  #
  # The second argument is the resource the user can perform the action on.
  # If you pass :all it will apply to every resource. Otherwise pass a Ruby
  # class of the resource.
  #
  # The third argument is an optional hash of conditions to further filter the
  # objects.
  # For example, here the user can only update published articles.
  #
  #   can :update, Article, :published => true
  #
  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
