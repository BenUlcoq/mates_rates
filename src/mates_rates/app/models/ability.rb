# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # All users can view tools.
    can :read, Tool

    # Permissions for signed in users (renters)
    return unless user.present?

    # Users can view rentals if they own the tool being rented.
      can [:read], Rental, Rental do |rental|
        user.id == rental.tool.user_id
      end

      # Users can rent tools and cancel them.
      can [:read, :create, :delete], Rental, user_id: user.id
      

      # Owners can delete Rentals if they need to.
      can :delete, Rental,  Rental do |rental|
        user.id == rental.tool.user_id
      end

      # Once a rental is complete, the person renting the tool can't edit it.
      cannot :edit, Rental, Rental do |rental|
        user.id == rental.user.id && rental.end_date < Date.today
      end

      # Rentals cannot be deleted if the start date is less than a day away (includes past rentals)
      cannot :delete, Rental, Rental do |rental|
        rental.start_date <= Date.today + 1.day
      end

      # Tool owners can edit rentals after the data to set 'returned' value to true.
      # Returned value would be used to trigger payment if Stripe was enabled.
      can :edit, Rental, Rental do |rental|
        user.id == rental.tool.user_id && rental.end_date < Date.today
      end

      # Once the rental has been completed, no one can edit it except admins.
      cannot :edit, Rental, Rental do |rental|
        rental.returned == true
      end

    return unless user.has_role? :owner
    # Owners can manage tools.
      can :manage, Tool, user_id: user.id

    return unless user.has_role? :admin
     # Admins are all powerful.
      can :manage, :all
    

  end
end
