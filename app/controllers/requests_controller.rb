class RequestsController < ApplicationController

  def show
    @request = Request.find(params[:id])
  end

  def new
    @cart = Cart.find(session[:cart_id])
    @request = Request.new
    @request.experiences.build
    @request.educations.build
    @request.volunteers.build
    @request.skills.build
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      @order = Order.new
      if @order.save
        @order.request = @request
        @order.cart = Cart.find(session[:cart_id])
        session[:order_id] = @order.id
        redirect_to checkout_path
      else
        render :new
      end

      # client = SendGrid::Client.new(api_key: ENV['rtr_test_key'])
      # mail = SendGrid::Mail.new do |m|
      #   m.to = "#{@request.email}"
      #   m.from = 'thatguyzakai@gmail.com'
      #   m.subject = 'Success!'
      #   m.text = "I heard you like pineapple, #{@request.name}."
      # end
      # res = client.send(mail)
      # p res.code
      # p res.body
    else
      render :new
    end
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :address, :phone_number, :objective, experiences_attributes: [:company, :location, :start_date, :end_date, :job_title, :responsibilities, :awards], educations_attributes: [:school_name, :degree, :location, :awards, :graduation_date], skills_attributes: [:description], volunteers_attributes: [:organization, :location, :start_date, :end_date, :duties])
  end
end
