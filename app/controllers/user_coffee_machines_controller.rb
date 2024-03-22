class UserCoffeeMachinesController < ApplicationController
  def create
    @coffee_machine = current_user.user_coffee_machines.build(coffee_machine_params)
    if @coffee_machine.save
      redirect_to my_coffeemachine_path, notice: 'Coffee machine was successfully added.'
    else
      render :new
    end
  end

  private

  def coffee_machine_params
    params.require(:user_coffee_machine).permit(:serial_number, :coffee_machine_id, :manager_id)
  end
end
