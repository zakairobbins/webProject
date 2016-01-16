class Order < ActiveRecord::Base
  has_one :cart, dependent: :nullify
  has_one :request, dependent: :nullify
  has_one :user
end
