class PayslipDetail < ApplicationRecord
  belongs_to :salary_detail
  belongs_to :payslip
end
