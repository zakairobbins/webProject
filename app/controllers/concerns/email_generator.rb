module EmailGenerator
  extend ActiveSupport::Concern

  private

  def new_order_email(request)
  email_string = "You have received a new order "

  end

  def consultation_email(params)
    email_string = "You have received a new request for consultation: \n"
    email_string += "\nCustomer name: \n #{params[:name]} \n"
    email_string += "Phone number: \n #{params[:phone_number]} \n"
    email_string += "Email: \n #{params[:email]} \n"
    email_string += "Message: \n #{params[:message]} \n"
    return email_string
  end
end
