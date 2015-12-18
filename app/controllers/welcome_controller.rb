class WelcomeController < ApplicationController
  include CurrentCart

def index
  set_cart
  p params
end


end
