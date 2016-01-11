class ContactController < ApplicationController
  include EmailGenerator

  def new
  end

  def create
    p params
    client = SendGrid::Client.new(api_key: ENV['rtr_test_key'])
      mail = SendGrid::Mail.new do |m|
        m.to = 'thatguyzakai@gmail.com'
        m.from = params[:email]
        m.subject = 'Contact request!'
        m.text = consultation_email(params)
        m.add_attachment
      end
      res = client.send(mail)
      p res.code
      p res.body
      flash[:success] = "Thank you for your message, we will get back to you shortly."
      redirect_to root_url
  end
end
