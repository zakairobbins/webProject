module EmailGenerator
  extend ActiveSupport::Concern

  private

  def new_order_email(order)
    request = order.request
    experiences = request.experiences
    email_string = "You have received a new order \n"
    email_string += "\nCustomer name: \n #{request.name} \n"
    email_string += "Phone number: \n #{request.phone_number} \n"
    email_string += "Email: \n #{request.email} \n"
    email_string += "Objective: \n #{request.objective} \n"
    email_string += "Comments: \n #{request.comment} \n"
    email_string += "EXPERIENCE: \n\n"
    experiences.each_with_index do |ex, index|
      email_string += (index + 1).to_s + " \n\n"
      email_string += "Company: " + ex.company + " \n\n"
      email_string += "Location: " + ex.location + " \n\n"
      email_string += "Start Date: " + ex.start_date.to_s + " \n\n"
      email_string += "End Date: " + ex.end_date.to_s + " \n\n"
      email_string += "Job Title: " + ex.job_title + " \n\n"
      email_string += "Responsibilities: " + ex.responsibilities + " \n\n"
      email_string += "Awards: " + ex.awards + " \n\n"
    end
    return email_string

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
