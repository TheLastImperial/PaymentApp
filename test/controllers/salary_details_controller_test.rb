require "test_helper"

class SalaryDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salary_detail = salary_details(:one)
  end

  test "should get index" do
    get salary_details_url, as: :json
    assert_response :success
  end

  test "should create salary_detail" do
    assert_difference("SalaryDetail.count") do
      post salary_details_url, params: { salary_detail: { conditional_value: @salary_detail.conditional_value, default_value: @salary_detail.default_value, is_discount: @salary_detail.is_discount, is_main: @salary_detail.is_main, is_quantity: @salary_detail.is_quantity, name: @salary_detail.name, role_id: @salary_detail.role_id, value: @salary_detail.value } }, as: :json
    end

    assert_response :created
  end

  test "should show salary_detail" do
    get salary_detail_url(@salary_detail), as: :json
    assert_response :success
  end

  test "should update salary_detail" do
    patch salary_detail_url(@salary_detail), params: { salary_detail: { conditional_value: @salary_detail.conditional_value, default_value: @salary_detail.default_value, is_discount: @salary_detail.is_discount, is_main: @salary_detail.is_main, is_quantity: @salary_detail.is_quantity, name: @salary_detail.name, role_id: @salary_detail.role_id, value: @salary_detail.value } }, as: :json
    assert_response :success
  end

  test "should destroy salary_detail" do
    assert_difference("SalaryDetail.count", -1) do
      delete salary_detail_url(@salary_detail), as: :json
    end

    assert_response :no_content
  end
end
