class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end
  
  def create
    @subscriber = Subscriber.new(subscriber_params)
    
    if @subscriber.save
      redirect_to root_path, notice: 'Thanks for subscribing!'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def subscriber_params
    params.require(:subscriber).permit(:email, :name, :about)
  end
end 