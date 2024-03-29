class CoffeeMachinesController < ApplicationController
  def index
    @coffee_machines = CoffeeMachine.all
    @allerrors = ErrorMessage.all
  end

  def show
    @coffee_machine = CoffeeMachine.find(params[:id])
  end

  def my_coffeemachine
    @user_coffeemachines = UserCoffeeMachine.where(user_id: current_user.id).map { |user_coffee_machine| user_coffee_machine.coffee_machine }
    @user = current_user
    @coffee_machine = UserCoffeeMachine.new
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
    params.require(:coffee_machine).permit(:serial_number, :coffee_machine_model_id, :manager_id)
  end

end
