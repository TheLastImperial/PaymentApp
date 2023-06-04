class Payslip < ApplicationRecord
  belongs_to :employee
  has_many :payslip_details
  accepts_nested_attributes_for :payslip_details
end
