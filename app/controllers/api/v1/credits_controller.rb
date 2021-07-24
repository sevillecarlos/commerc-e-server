class Api::V1::CreditsController < ApplicationController
  def index
    @credit = Credit.all
    render json: @credit
  end

  def show
    @credit = User.find_by_id(params[:id])
    if @credit
      render json: @credit.credits ,status:200
    else
      render json: {error:"User dont exit"} ,status:400
    end
  end

  def create
    @user = User.find_by_id(credit_params['user_id'])
    if @user
      @credit = Credit.create!(amount:credit_params['amount'],user:@user)
      if @credit
        render json: @user.credits
      end
    end
  end

  def update
  end

  private 
  def credit_params
    params.require(:credit).permit(:amount, :user_id)
  end
end
