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
  def new
    @coffee_machine = CoffeeMachine.new
  end

  def create
    @coffee_machine = current_user.coffee_machines.build(coffee_machine_params)
    if @coffee_machine.save
      redirect_to coffee_machine_path(@coffee_machine), notice: 'Coffee machine was successfully created.'
    else
      render :new
    end
  end

  private

  def coffee_machine_params
    params.require(:coffee_machine).permit(:UniqueLoginCode, :serial_number, :machine_type, :description, :coffee_machine_model_id, :manager_id , :photo)
  end


end
