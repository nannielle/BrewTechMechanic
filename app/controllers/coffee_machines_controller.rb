class CoffeeMachinesController < ApplicationController
  def index
    @coffee_machines = CoffeeMachine.all
  end

  def show
    @coffee_machine = CoffeeMachine.find(params[:id])
  end
end
