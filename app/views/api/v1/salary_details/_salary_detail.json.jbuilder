json.extract! salary_detail, :id, :name, :value, :default_value, :conditional_value, :is_quantity, :is_discount, :is_main, :role_id, :created_at, :updated_at
json.url api_v1_salary_details_url(salary_detail, format: :json)
