class ContactController < ApplicationController
  def new
  end

  def create
    p params
    client = SendGrid::Client.new(api_key: ENV['rtr_test_key'])
      mail = SendGrid::Mail.new do |m|
        m.to = 'thatguyzakai@gmail.com'
        m.from = params[:email]
        m.subject = 'Contact request!'
        m.text = params[:name]
      end
      res = client.send(mail)
      p res.code
      p res.body
      redirect_to contact_new_path
  end
end
