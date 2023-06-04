class Payslip < ApplicationRecord
  belongs_to :employee
  has_many :payslip_details, dependent: :delete_all
  accepts_nested_attributes_for :payslip_details
end
