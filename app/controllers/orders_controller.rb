class OrdersController < ApplicationController
  include EmailGenerator

  def create
    @order = Order.new
    @order.cart
  end

  def show
  end

  def update
    order = Order.find(params[:id])
    respond_to do |format|
      format.json{
        order.update_attributes(completed: true)
        client = SendGrid::Client.new(api_key: ENV['rtr_test_key'])
        mail = SendGrid::Mail.new do |m|
          m.to = 'zakairobbins@gmail.com'
          m.from = order.request.email
          m.subject = 'You have a new order!'
          m.text = new_order_email(order)
          m.add_attachment(order.request.file.current_path)
        end
        res = client.send(mail)
        p res.code
        p res.body
        render json: order
      }

    end
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit()
  end
end
