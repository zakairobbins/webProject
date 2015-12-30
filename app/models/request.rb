class Request < ActiveRecord::Base
  has_many :skills, dependent: :destroy
  has_many :volunteers, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :experiences, dependent: :destroy
  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :volunteers
  accepts_nested_attributes_for :educations
  accepts_nested_attributes_for :experiences
end
