class CoffeeMachinesController < ApplicationController
  def index
    @coffee_machines = CoffeeMachine.all
  end

  def show
    @coffee_machine = CoffeeMachine.find(params[:id])
  end

  def my_coffeemachine
    @user_coffeemachines = CoffeeMachine.where(user_id: current_user.id)
    @user = current_user
  end
end
