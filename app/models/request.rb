class Request < ActiveRecord::Base
  has_many :skills, dependent: :destroy
  has_many :volunteers, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :experiences, dependent: :destroy
end
