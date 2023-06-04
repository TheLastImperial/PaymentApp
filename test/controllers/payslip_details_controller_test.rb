require "test_helper"

class PayslipDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payslip_detail = payslip_details(:one)
  end

  test "should get index" do
    get payslip_details_url, as: :json
    assert_response :success
  end

  test "should create payslip_detail" do
    assert_difference("PayslipDetail.count") do
      post payslip_details_url, params: { payslip_detail: { description: @payslip_detail.description, payslip_id: @payslip_detail.payslip_id, quantity: @payslip_detail.quantity, salary_detail_id: @payslip_detail.salary_detail_id, total: @payslip_detail.total } }, as: :json
    end

    assert_response :created
  end

  test "should show payslip_detail" do
    get payslip_detail_url(@payslip_detail), as: :json
    assert_response :success
  end

  test "should update payslip_detail" do
    patch payslip_detail_url(@payslip_detail), params: { payslip_detail: { description: @payslip_detail.description, payslip_id: @payslip_detail.payslip_id, quantity: @payslip_detail.quantity, salary_detail_id: @payslip_detail.salary_detail_id, total: @payslip_detail.total } }, as: :json
    assert_response :success
  end

  test "should destroy payslip_detail" do
    assert_difference("PayslipDetail.count", -1) do
      delete payslip_detail_url(@payslip_detail), as: :json
    end

    assert_response :no_content
  end
end
