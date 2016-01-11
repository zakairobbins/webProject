class Request < ActiveRecord::Base
  has_many :skills, dependent: :destroy
  has_many :volunteers, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :experiences, dependent: :destroy
  belongs_to :order
  accepts_nested_attributes_for :skills,
                                reject_if: lambda { |a| a[:description].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :volunteers,
                                reject_if: lambda { |a| a[:organization].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :educations,
                                reject_if: lambda { |a| a[:school_name].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :experiences,
                                reject_if: lambda { |a| a[:company].blank? },
                                allow_destroy: true
end
