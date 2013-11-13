class ContactController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      ContactMailer.contact_us(@message).deliver
      redirect_to root_path, notice: "Thank you! I'll get right back to you!"
    else
      flash.now.alert = "Please correct changes listed below"
      render :new
    end
  end
end