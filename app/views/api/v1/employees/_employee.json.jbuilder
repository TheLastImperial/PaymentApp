json.extract! employee, :id, :name, :created_at, :updated_at
json.url api_v1_employee_url(employee, format: :json)
