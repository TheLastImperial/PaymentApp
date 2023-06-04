json.extract! payslip_detail, :id, :description, :quantity, :total, :salary_detail_id, :payslip_id, :created_at, :updated_at
json.url payslip_detail_url(payslip_detail, format: :json)
