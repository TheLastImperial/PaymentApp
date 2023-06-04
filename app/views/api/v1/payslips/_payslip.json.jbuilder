json.extract! payslip, :id, :total, :employee_id, :created_at, :updated_at
json.url api_v1_payslip_url(payslip, format: :json)
