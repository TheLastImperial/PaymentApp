json.partial! "api/v1/payslips/payslip", payslip: @payslip
json.employee @payslip.employee
json.payslip_details @payslip.payslip_details
